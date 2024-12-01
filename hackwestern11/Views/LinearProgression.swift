//
//  LinearProgression.swift
//  hackwestern11
//
//  Created by Helena Zhang on 2024-11-30.
//

import SwiftUI


struct LinearProgressDemoView: View {
    var incrementSize: Float  // Parameter to control how much the progress increases
    var goalsComplete: Int
    var progress: Float {
           // Calculate the total progress
           let calculatedProgress = incrementSize * Float(goalsComplete)
           // Ensure progress does not exceed 1.0 (100%)
           return min(calculatedProgress, 1.0)
       }
    let customSymbol = UIImage(named: "medal.fill")?.withRenderingMode(.alwaysTemplate)
    
    var progressColor: Color {
            if progress <= 0.33 {
                return .red
            } else if progress <= 0.66 {
                return .yellow
            } else {
                return .green
            }
        }
    
    @State private var isVisible = true
    
    var body: some View {
        HStack{
        VStack {
            let size = Int(100/(incrementSize/0.01))
            let temp = min(goalsComplete, size)
            // Progress bar showing the progress
            ProgressView(value: progress, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle())
                .accentColor(progressColor)
                .padding()
                Text("\(temp) / \(size) Goals Met")
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            Image(systemName: "medal.fill")
                .resizable()
                .frame(width: 32.0, height: 32.0)
            
                
        }
        .padding()
        .border(.white, width: 2)
        
    }
    
}

