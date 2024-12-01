//
//  NotifPage.swift
//  NotifTest
//
//  Created by Helena Zhang on 2024-11-30.
//

import SwiftUI


struct BadgesPage: View {
    var goalsComplete: Int
    
    var values = 1...7

    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 0){
                Text("Monthly Progress")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                ForEach(values, id: \.self) { val in
                    let temp = 0.05 * (8 - Float(val))
                    LinearProgressDemoView(incrementSize: temp, goalsComplete: goalsComplete)
                    
                        .foregroundStyle(
                            MeshGradient(width: 2, height: 2, points: [
                                [0, 0], [1, 0],
                                [0, 1], [1, 1]
                            ], colors: [
                                .indigo, .cyan,
                                .purple, .pink
                            ]))
                        .padding()
                        .cornerRadius(20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.bottom)
            Spacer()
            HStack{
                Image(systemName: "medal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text("\(goalsComplete) goals completed this month!")
            }
            .frame(alignment: .leading)
            .padding(.bottom)
        }
    }
}

