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
                        }
                        TabView(selection: $activeTab) {
                            Tab(value: .planning){
                                PlanningView()
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            }
                        }
                        TabView(selection: $activeTab) {
                            Tab(value: .wellness){
                                WellnessView()
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            }
                            
                        }
                        
                        
                    } else {
                        
                    }
                }
            }
            VStack(){
                Spacer()
                CustomTabBar(activeTab: $activeTab)
            }
        }
        
    }

    

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
