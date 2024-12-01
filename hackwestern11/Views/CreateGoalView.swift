//
//  CreateGoalView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import Foundation
import SwiftUI
import SwiftData

struct CreateGoalView: View {
    @Binding var show: Bool
    @Environment(\.modelContext) var modelContext
    @State var goalName: String = ""
    var goal: Goal = Goal()
        
    init(show: Binding<Bool>) {
        self._show = show
        
        
    }
   
    /// View Properties
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "flag.pattern.checkered.2.crossed")
                .font(.title)
                .foregroundStyle(.white)
                .frame(width: 65, height: 65)
                .background {
                    Circle()
                        .fill(MeshGradient(width: 2, height: 2, points: [
                            [0, 0], [1, 0],
                            [0, 1], [1, 1]
                        ], colors: [
                            .indigo, .cyan,
                            .purple, .pink
                        ]))
                        .background {
                            Circle()
                                .fill(.background)
                                .padding(-5)
                        }
                }
            
            Text("Create A Goal!")
                .fontWeight(.semibold)
            
            Text("Enter Your Goal")
                .multilineTextAlignment(.center)
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.top, 5)
            
            TextField("Ex: No starbucks for a week", text: $goalName)
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.bar)
                }
                .padding(.vertical, 10)
            HStack(spacing: 10) {
                Button {
                    show = false
                } label: {
                    Text("Cancel")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 25)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.red.gradient)
                        }
                }
                Button {
                    goal.title = goalName
                    modelContext.insert(goal)
                    show = false
                } label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 25)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.blue.gradient)
                        }
                        
                }
            }
            
        }
        .frame(width: 250)
        .padding([.horizontal, .bottom], 20)
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(.background)
                .padding(.top, 25)
        }
    }
}
