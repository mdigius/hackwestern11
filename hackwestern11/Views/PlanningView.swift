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
    @State private var editMode = EditMode.inactive
    @State private var textInput: String = ""
    private static var count = 0
    @State private var showSaveSheet = false
    
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
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding()
                            .foregroundStyle(
                                MeshGradient(width: 2, height: 2, points: [
                                    [0, 0], [1, 0],
                                    [0, 1], [1, 1]
                                ], colors: [
                                    .indigo, .cyan,
                                    .purple, .pink
                                ])
                            )
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                        
                    }
                }
                Spacer()
                EditButton()
                    .padding()
            }
            
            // List
            ScrollView(){
                ForEach(goals){ goal in
                    GoalView(goal: goal)
                        .scrollTransition{ content, phase in content
                                .hueRotation(.degrees(75 * phase.value))
                                .opacity(phase.isIdentity ? 1 : 0.75)
                                .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                .blur(radius: phase.isIdentity ? 0 : 0.025)
                        }
//                        .swipeActions(edge: .trailing){
//                        Button(role: .destructive)
//                        {
//                            if let index = goals.firstIndex(where: { $0.id == goal.id })
//                            {
//                                let indexSet = IndexSet(integer: index)
//                                onDelete(offsets: indexSet)
//                            }
//                        }
//                        label: {
//                            Label("Delete", systemImage: "trash")
//                        }
//                    }
//                    .swipeActions(edge: .leading){
//                        Button (){
//                            if let index = goals.firstIndex(where: { $0.id == goal.id })
//                            {
//                                let indexSet = IndexSet(integer: index)
//                                onAchieved(achievedOffsets: indexSet)
//                            }
//                            
//                        }
//                    label:
//                        {
//                            Label("CheckMark", systemImage: "checkmark.circle")
//                        }.tint(.green)
//                    }.enableScrollViewSwipeActions()
                }
            }
            
            Spacer()
        }
        .environment(\.editMode, $editMode)
        .scrollContentBackground(.hidden)
        .popView(isPresented: $showSaveSheet) {
            
        } content: {
            CreateGoalView(show: $showSaveSheet)
        }
    }
    
    private func onAdd() {
        showSaveSheet.toggle()
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
