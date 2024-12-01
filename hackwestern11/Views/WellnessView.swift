//
//  WellnessView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import SwiftUI

struct WellnessView: View {
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        NavigationView {
            List {
                // Forum Functionality
                NavigationLink(destination: ForumListView()) {
                    HStack(spacing: 16) { // Add spacing between icon and text
                        Image(systemName: "message.fill") // Forum icon
                            .foregroundStyle(
                                MeshGradient(width: 2, height: 2, points: [
                                    [0, 0], [1, 0],
                                    [0, 1], [1, 1]
                                ], colors: [
                                    .indigo, .cyan,
                                    .purple, .pink
                                ])
                            )
                            .font(.system(size: 40)) // Increase icon size
                        
                        Text("Forums")
                            .font(.title2) // Increase text size
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 12) // Add vertical padding for the entire row
                }

                // Journaling Functionality (Placeholder)
                NavigationLink(destination: Text("Journaling Coming Soon")) {
                    HStack(spacing: 16) {
                        Image(systemName: "pencil.circle.fill") // Journaling icon
                            .foregroundStyle(
                                MeshGradient(width: 2, height: 2, points: [
                                    [0, 0], [1, 0],
                                    [0, 1], [1, 1]
                                ], colors: [
                                    .indigo, .cyan,
                                    .purple, .pink
                                ])
                            )
                            .font(.system(size: 40)) // Increase icon size
                        
                        Text("Journaling")
                            .font(.title2) // Increase text size
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 12)
                }

                // Guided Meditation Functionality (Placeholder)
                NavigationLink(destination: Text("Guided Meditation Coming Soon")) {
                    HStack(spacing: 16) {
                        Image(systemName: "leaf.circle.fill") // Meditation icon
                            .foregroundStyle(
                                MeshGradient(width: 2, height: 2, points: [
                                    [0, 0], [1, 0],
                                    [0, 1], [1, 1]
                                ], colors: [
                                    .indigo, .cyan,
                                    .purple, .pink
                                ])
                            )
                            .font(.system(size: 40)) // Increase icon size
                        
                        Text("Guided Meditation")
                            .font(.title2) // Increase text size
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 12)
                }
            }
            .listStyle(.plain) // Optionally, use a plain list style for a cleaner look
            .navigationTitle("Wellness")
        }
    }
}
