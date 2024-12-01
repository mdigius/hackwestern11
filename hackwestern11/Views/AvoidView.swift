//
//  AvoidView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-12-01.
//

//
//  ContributeSavingView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-12-01.
//

//
//  CreateGoalView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import Foundation
import SwiftUI
import SwiftData

struct AvoidView: View {
    @Binding var show: Bool
    @Environment(\.modelContext) var modelContext
    
    @Binding var goal: Goal
    
    init(show: Binding<Bool>, goal: Binding<Goal>) {
        self._show = show
        self._goal = goal
        
        
    }
   
    /// View Properties
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: "exclamationmark.3")
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
            Spacer()
                .frame(height: 50)
            Text("Did you skip \(goal.title) and save $\(goal.cost)?")
                .multilineTextAlignment(.center)
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.top, 5)
            

            HStack(spacing: 10) {
                Button {
                    show = false
                } label: {
                    Text("No")
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
                    withAnimation(){
                        goal.totalSavings += goal.cost
                        show = false
                    }
                } label: {
                    Text("Yes")
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
