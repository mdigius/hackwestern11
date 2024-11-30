//
//  LearningView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import SwiftUI
import SwiftData


struct LearningView: View {
    @Environment(\.modelContext) private var modelContext
    let learningItems: [LearningItem] = [
        LearningItem(title: "Master Budgeting", itemDescription: "Learn how to manage your budget effectively.", imageName: "dollarsign.circle"),
        LearningItem(title: "Understanding Taxes", itemDescription: "Key insights into tax filing and returns.", imageName: "doc.text"),
        LearningItem(title: "Investments 101", itemDescription: "Start your journey into investing.", imageName: "chart.bar"),
        LearningItem(title: "Loans & Borrowing", itemDescription: "Tips for handling loans and credit responsibly.", imageName: "creditcard"),
        LearningItem(title: "Paycheck Breakdown", itemDescription: "Understand the components of your paycheck.", imageName: "calendar")
    ]
    
    var guides: [Guide] = [
        Guide(icon: "clock", title: "Testing1", subtitle: "Testing"),
        Guide(icon: "pencil", title: "Testing2", subtitle: "Testing"),
        Guide(icon: "person", title: "Testing3", subtitle: "Testing"),
        Guide(icon: "brain", title: "Testing4", subtitle: "Testing")
    ]

    var body: some View {
        NavigationView { // Wrap in NavigationView
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Large, featured item
                    LearningItemView(item: learningItems[0], isLarge: true)

                    
                    // Horizontal scroll view
                    Text("Explore Topics")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            ForEach(learningItems.dropFirst()) { item in
                                LearningItemView(item: item, isLarge: false)
                                    .scrollTransition { content, phase in
                                        content
                                            .hueRotation(.degrees(45 * phase.value))
                                            .scaleEffect(phase.isIdentity ? 1 : 0.925)
                                            .blur(radius: phase.isIdentity ? 0 : 2)
                                    }
                                    
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Horizontal scroll view
                    Text("Recent Guides")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    ForEach(guides, id: \.self) { guide in
                        GuideView(guide: guide)
                    }
                    
                    
                }
                .padding(.top)
            }
            .navigationTitle("Learning Hub") // Set navigation title
        }
    }
}

@Model
class Guide {
    var icon: String
    var title: String
    var subtitle: String
    
    init(icon: String, title: String, subtitle: String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
    }
    
    
}
struct GuideView: View {
    var guide: Guide
    
    var body: some View {
        ZStack(){
            RoundedRectangle(cornerRadius: 15)
                .shadow(color: .black.opacity(0.5), radius: 4)
                .foregroundStyle(.white)
            
            
            HStack(){
                Image(systemName: guide.icon)
                    .font(.title)
                    .foregroundStyle(
                        MeshGradient(width: 2, height: 2, points: [
                            [0, 0], [1, 0],
                            [0, 1], [1, 1]
                        ], colors: [
                            .indigo, .cyan,
                            .purple, .pink
                        ])
                    )
                    .padding()
                VStack(alignment: .leading){
                    Text(guide.title)
                        .font(.title3)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    Text(guide.subtitle)
                        .font(.body)
                        .foregroundColor(.black)
                    
                }
                
                Spacer()
                    
            }
                
        }
        
        
        .frame(height: 75)
        .padding(.horizontal)
    }
    
}
