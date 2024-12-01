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
    @State var type: String = "Personal"
    @State var frequency: String = "Daily"
    @State var totalAmount: Double = 0
    
    @State var cost: Double = 0
    
    @State private var costString: String = ""
    @State private var totalAmountString: String = ""
    @State var goal: Goal = Goal()
    
    init(show: Binding<Bool>) {
        self._show = show
        
        
    }
   
    /// View Properties
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: "medal")
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
            
            Text("Goal Type")
                .multilineTextAlignment(.center)
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.top, 5)
            Picker(selection: $type, label: Label("Goal Type", systemImage: "tag")) {
                HStack {
                    Image(systemName: "figure.mind.and.body")
                        .padding()
                    Spacer()
                        .frame(width: 15)
                    Text("Personal")
                }
                .tag("Personal")
                HStack {
                    Image(systemName: "exclamationmark.triangle")
                        .padding()
                    Spacer()
                        .frame(width: 15)
                    Text("Avoid An Expense")
                }
                .tag("Avoid")
                HStack {
                    Image(systemName: "dollarsign.bank.building")
                        .padding()
                    Spacer()
                        .frame(width: 15)
                    Text("Save For Something")
                }
                .tag("Saving")
            }
            
            if(type == "Avoid") {
                Text("What are you avoiding?")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 5)
                TextField("Ex: Daily Starbucks", text: $goalName)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.bar)
                    }
                    .padding(.vertical, 10)
                
                Text("How often?")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 5)
                Picker(selection: $frequency, label: Label("Frequency", systemImage: "calendar")) {
                    HStack {
                        Text("Daily")
                    }
                    .tag("Daily")
                    HStack {
                        Text("Weekly")
                    }
                    .tag("Weekly")
                    HStack {
                        Text("Monthly")
                    }
                    .tag("Monthly")
                }
                
                Text("Cost of the expense")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 5)
                TextField("Ex: $564.43", text: $costString)
                        .onChange(of: costString) { newValue, oldValue in
                            // Convert string to double
                            if let value = Double(newValue) {
                                cost = value
                            } else {
                                cost = 0.0 // Handle invalid input
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
                
            } else if(type == "Personal"){
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
            } else {
                Text("What are you saving for?")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 5)
                TextField("Ex: Clapped 1996 Civic", text: $goalName)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.bar)
                    }
                    .padding(.vertical, 10)
                
                Text("Total Cost")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 5)
                TextField("Ex: $0.53", text: $totalAmountString)
                    .onChange(of: totalAmountString) { newValue, oldValue in
                            // Convert string to double
                            if let value = Double(newValue) {
                                totalAmount = value
                            } else {
                                totalAmount = 0.0 // Handle invalid input
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
                
            }
                
            
            

           
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
                    if(goal.type == "Avoid") {
                        goal.cost = cost
                        goal.frequency = frequency
                    } else if(goal.type == "Saving") {
                        goal.totalAmount = totalAmount
                    }
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
