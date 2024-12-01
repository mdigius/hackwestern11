//
//  PlanningView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import SwiftUI
import SwiftData

struct PlanningView: View
{
    @Environment(\.modelContext) private var modelContext
    @Query private var goals: [Goal]
    @Query private var attainedGoals: [AttainedGoal]
    @State private var editMode = EditMode.inactive
    @State private var textInput: String = ""
    private static var count = 0

    var body: some View {
        VStack {

            // Title
            Text("Planning")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            Text("Set Your Weekly Financial Goals")
                .font(.body)
                .foregroundColor(.gray)
            
            // Header
            HStack {
                if editMode == .inactive {
                    Button(action: onAdd) {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding()
                    }
                }
                Spacer()
                EditButton()
                    .padding()
            }

            // List
            List {
                ForEach(goals) { goal in
                    TextField("Edit list name", text: Binding(
                        get: { goal.title },
                        set: { newValue in
                            goal.title = newValue
                            try? modelContext.save()
                        }
                    ))
                    .padding(10)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .swipeActions(edge: .trailing)
                    {
                        Button(role: .destructive) {
                            if let index = goals.firstIndex(where: { $0.id == goal.id }) {
                                let indexSet = IndexSet(integer: index)
                                onDelete(offsets: indexSet)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .swipeActions(edge: .leading)
                    {
                        Button ()
                        {
                            if let index = goals.firstIndex(where: { $0.id == goal.id })
                            {
                                let indexSet = IndexSet(integer: index)
                                onAchieved(achievedOffsets: indexSet)
                            }
                                
                        }
                        label:
                        {
                        Label("CheckMark", systemImage: "checkmark.circle")
                        }.tint(.green)
                    }
                }
                .onMove(perform: onMove)
                .listRowBackground(Capsule().fill(Color.black).padding(2)) // Capsule with gray background
        
            }
            .environment(\.editMode, $editMode)
            .scrollContentBackground(.hidden)

            Spacer()
        }
    }

    private func onAdd() {
        let newGoal = Goal(title: "Goal #\(Self.count)")
        modelContext.insert(newGoal)
        try? modelContext.save()
        Self.count += 1
    }

    private func onDelete(offsets: IndexSet) {
        for index in offsets {
            let goalToDelete = goals[index]
            modelContext.delete(goalToDelete)
        }
        try? modelContext.save()
    }

    private func onMove(source: IndexSet, destination: Int) {
        // Add logic for moving items if necessary
    }
    
    private func onAchieved(achievedOffsets: IndexSet) {
        for index in achievedOffsets.sorted(by: >) { // Sort indices in descending order to prevent shifting
            let achievedGoal = AttainedGoal(title: goals[index].title)
            modelContext.insert(achievedGoal) // Add to attained goals
            modelContext.delete(goals[index]) // Remove from current goals
        }
        do {
            try modelContext.save() // Save all changes
        } catch {
            print("Error saving context: \(error)") // Debug output for errors
        }
    }

}
