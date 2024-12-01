//
//  ContentView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import SwiftUI
import SwiftData
import Auth0

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var activeTab: TabModel = .planning
    @State private var user = User(id: "nil", email: "nil", picture: "nil")
    @Query(filter: #Predicate<Goal> { goal in
        goal.completed == true})
        var attainedGoals: [Goal]


    
    private var numGoals: Int {
        attainedGoals.count
    }
    
    var body: some View {
        ZStack(){
            if user.id != "nil" {
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
                                Tab(value: .badges){
                                    BadgesPage(goalsComplete: numGoals)
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
                    HStack(){
                        Spacer()
                        // Display profile picture from user.image url
                        
                        Button(action: {
                            Auth0
                                .webAuth()
                                .useHTTPS() // Use a Universal Link logout URL on iOS 17.4+ / macOS 14.4+
                                .clearSession { result in
                                    switch result {
                                    case .success:
                                        print("Logged out")
                                        user = User(id: "nil", email: "nil", picture: "nil")
                                    case .failure(let error):
                                        print("Failed with: \(error)")
                                    }
                                }
                            }) {
                                AsyncImage(url: URL(string: user.picture)) { image in
                                    image
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Color.blue
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                }
                                .padding()
                            }
                            .opacity(activeTab == .planning ? 1 : 0)
                            .disabled(activeTab == .planning ? false : true)
                            .buttonStyle(PlainButtonStyle()) // Removes any button styling
                    }
                    Spacer()
                }
            } else {
                LoginView(user: $user)
            }
            
        }
        
    }

    

}

#Preview {
    ContentView()

        .modelContainer(for: [Post.self, Comment.self, Goal.self, LearningItem.self,AttainedGoal.self], inMemory: true)

}

