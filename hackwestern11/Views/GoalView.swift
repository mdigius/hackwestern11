//
//  GoalView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//
import SwiftUI
struct GoalView: View
{
    var goal: Goal
    
    init(goal: Goal)
    {
        self.goal = goal
    }
    
    var body: some View
    {
        ZStack()
            {
            RoundedRectangle(cornerRadius: 15).fill(Color.indigo)
            HStack(alignment: .center)
                {
                Text(goal.title)
                    .foregroundStyle(.white)
                    .font(.title2)
                    .padding()
                Spacer()
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 80)
    }
}
