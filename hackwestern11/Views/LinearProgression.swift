import SwiftUI

struct LinearProgressDemoView: View {
    var incrementSize: Float  // Parameter to control how much the progress increases
    var goalsComplete: Int
    
    var size: Int {
        // Calculate total number of goals for 100% progress
        return Int(1.0 / incrementSize)
    }
    
    var progress: Float {
        // Normalize progress to a value between 0.0 and 1.0
        return min(Float(goalsComplete) / Float(size), 1.0)
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
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(.white)
            
            HStack {
                VStack {
                    // Display goals completed out of total goals
                    let temp = min(goalsComplete, size)
                    
                    ProgressView(value: progress, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle())
                        .accentColor(progressColor)
                        .padding()
                    
                    Text("\(temp) / \(size) Goals Met")
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                
                Image(systemName: "medal")
                    .resizable()
                    .frame(width: 40, height: 48)
                    .scaledToFill()
                    .foregroundStyle(
                        MeshGradient(width: 2, height: 2, points: [
                            [0, 0], [1, 0],
                            [0, 1], [1, 1]
                        ], colors: [
                            .indigo, .cyan,
                            .purple, .pink
                        ])
                    )
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
    }
}
