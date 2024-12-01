//
//  hackwestern11App.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import SwiftUI
import SwiftData

@main
struct hackwestern11App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Post.self,
            Comment.self,
            Goal.self,
            AttainedGoal.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
