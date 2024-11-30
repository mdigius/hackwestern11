//
//  WellnessView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import SwiftUI

struct WellnessView: View {
    var body: some View {
        NavigationView {
            List {
                // Forum Functionality
                NavigationLink(destination: ForumListView()) {
                    HStack {
                        Image(systemName: "message.fill") // Forum icon
                            .foregroundColor(.blue)
                        Text("Forums")
                    }
                }

                // Journaling Functionality (Placeholder)
                NavigationLink(destination: Text("Journaling Coming Soon")) {
                    HStack {
                        Image(systemName: "pencil.circle.fill") // Journaling icon
                            .foregroundColor(.green)
                        Text("Journaling")
                    }
                }

                // Guided Meditation Functionality (Placeholder)
                NavigationLink(destination: Text("Guided Meditation Coming Soon")) {
                    HStack {
                        Image(systemName: "leaf.circle.fill") // Meditation icon
                            .foregroundColor(.purple)
                        Text("Guided Meditation")
                    }
                }
            }
            .navigationTitle("Wellness")
        }
    }
}
