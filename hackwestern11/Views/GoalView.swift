//
//  GoalView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//
import SwiftUI
import SwiftData
struct GoalView: View {
    @State var goal: Goal
    @State var showContribute: Bool = false
    @State var showAvoid: Bool = false
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
                        .foregroundStyle(goal.completed ? Color.green : .white)
                        .font(.body)
                        .fontWeight(.medium)
                        .padding()
                    if(!goal.completed){
                        Button(action: {
                            withAnimation(.smooth(duration: 0.5, extraBounce: 0.25)){
                                showContribute.toggle()
                            }
                        }, label: {
                            
                            Image(systemName: "plus.circle")
                                .foregroundStyle(.white)
                                .font(.title2)
                        })
                        .padding(.trailing)
                    }
                        
                } else if (goal.type == "Avoid"){
                    Text("Total Savings: $\(String(format: "%.2f", goal.totalSavings))")
                        .foregroundStyle(.white)
                        .font(.body)
                        .padding()
                    Button(action: {
                        withAnimation(.smooth(duration: 0.5, extraBounce: 0.25)){
                            showAvoid.toggle()
                        }
                    }, label: {
                        
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.white)
                            .font(.title2)
                    })
                    .padding(.trailing)
                    
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
        .popView(isPresented: $showContribute) {
            
        } content: {
            ContributeSavingView(show: $showContribute, goal: $goal)
        }
        .popView(isPresented: $showAvoid) {
            
        } content: {
            AvoidView(show: $showAvoid, goal: $goal)
        }
    
    }
}
