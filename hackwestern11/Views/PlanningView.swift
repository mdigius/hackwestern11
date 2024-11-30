//
//  PlanningView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import SwiftUI
import SwiftData

struct PlanningView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var goals: [Goal]
    @State private var editMode = EditMode.inactive
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
            HStack
            {
                if editMode == .inactive
                {
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
                    Text(goal.title)
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)
            }
            .environment(\.editMode, $editMode)
            

            Spacer()
        }
    }

    private func onAdd()
    {
        print("here")
        let newGoal = Goal(title: "Goal #\(Self.count)")
        modelContext.insert(newGoal)
        do {
            try modelContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
        Self.count += 1
    }

    private func onDelete(offsets: IndexSet) {
        for index in offsets {
            let goalToDelete = goals[index]
            modelContext.delete(goalToDelete)
        }
        do {
            try modelContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }

    private func onMove(source: IndexSet, destination: Int) {
        // Add logic for moving items if necessary
    }
}
