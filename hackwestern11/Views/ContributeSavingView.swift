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

struct ContributeSavingView: View {
    @Binding var show: Bool
    @Environment(\.modelContext) var modelContext
    
    @State var amountString: String = ""
    @State var amount: Double = 0.0
    
    @Binding var goal: Goal
    
    init(show: Binding<Bool>, goal: Binding<Goal>) {
        self._show = show
        self._goal = goal
        
        
    }
   
    /// View Properties
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: "dollarsign")
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
            
            Text("Amount Saved")
                .multilineTextAlignment(.center)
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.top, 5)
            TextField("Ex: $15", text: $amountString)
                .onChange(of: amountString) {
                        // Convert string to double
                    if let value = Double(amountString) {
                            amount = value
                        } else {
                            amount = 0.0 // Handle invalid input
                        }
                    }
                    .keyboardType(.decimalPad) // Show numeric keyboard with decimal
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
                    withAnimation(){
                        goal.currentAmount += amount
                        if(goal.currentAmount >= goal.totalAmount){
                            goal.completed = true
                        }
                        show = false
                    }
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
