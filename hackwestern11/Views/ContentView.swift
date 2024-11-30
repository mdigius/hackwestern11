//
//  ContentView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var activeTab: TabModel = .planning
    var body: some View {
        ZStack(){
            VStack(){
                Group {
                    if #available(iOS 18, *) {
                        TabView(selection: $activeTab) {
                            Tab(value: .learning){
                                LearningView()
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            }
                            Tab(value: .planning){
                                PlanningView()
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            }
                            Tab(value: .wellness){
                                WellnessView()
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            }
                        }
                        
                    } else {
                        
                    }
                }
                Spacer()
                CustomTabBar(activeTab: $activeTab)
            }
            VStack(){
                
            }
        }
        
    }

    

}

#Preview {
    ContentView()
<<<<<<< HEAD
        .modelContainer(for: [Item.self,Goal.self], inMemory: true)
=======
        .modelContainer(for: [Item.self, Post.self, Comment.self], inMemory: true)
>>>>>>> 1a15ce89b87260b2c514c1e30fd1d455e31d36e2
}
