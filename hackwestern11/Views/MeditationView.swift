//
//  MeditationView.swift
//  hackwestern11
//
//  Created by Jacob on 2024-12-01.
//

import SwiftUI

struct MeditationView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Guided Meditation")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 40)

            // Meditation Image
            Image(systemName: "figure.mind.and.body.circle")
                .font(.system(size: 144, weight: .light)) // Set size and weight
                .foregroundStyle(
                    MeshGradient(width: 2, height: 2, points: [
                        [0, 0], [1, 0],
                        [0, 1], [1, 1]
                    ], colors: [
                        .indigo, .cyan,
                        .purple, .pink
                    ])
                )

            // Description
            Text("Take a moment to breathe and relax. Follow guided meditations to reduce stress and improve focus.")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("Meditation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MeditationView()
}
