//
//  GoalView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//
import SwiftUI
import SwiftData
struct GoalView: View {
    var goal: Goal
    
    init(goal: Goal){
        self.goal = goal
        print(goal.image)
    }
    
    var body: some View {
        ZStack(){
            RoundedRectangle(cornerRadius: 15).fill(Color.indigo)
            HStack(alignment: .center){
                Image(systemName: goal.image)
                    .padding(.leading)
                    .foregroundStyle(.white)
                    .font(.title)
                Text(goal.title)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .padding(.vertical)
                Spacer()
                
                if(goal.type == "Saving"){
                    Text("$\(String(format: "%.2f", goal.currentAmount)) / $\(String(format: "%.2f", goal.totalAmount))")
                        .foregroundStyle(.white)
                        .font(.body)
                        .padding()
                        
                } else if (goal.type == "Avoid"){
                    Text("Total Savings: $\(String(format: "%.2f", goal.totalSavings))")
                        .foregroundStyle(.white)
                        .font(.body)
                        .padding()
                } else {
                    Button(action: {
                        withAnimation(.smooth(duration: 0.5, extraBounce: 0.25)){
                            goal.completed.toggle()
                        }
                    }, label: {
                        Image(systemName: goal.completed ? "checkmark.circle" : "circle")
                            .padding()
                            .foregroundStyle(.white)
                            .font(.title)
                    })
                    
                }
                
                
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 80)
    }
}
