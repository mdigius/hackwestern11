//
//  LearningView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import SwiftUI

struct LearningView: View {
    @Environment(\.modelContext) private var modelContext
    let learningItems: [LearningItem] = [
        LearningItem(title: "Master Budgeting", itemDescription: "Learn how to manage your budget effectively.", imageName: "dollarsign.circle"),
        LearningItem(title: "Understanding Taxes", itemDescription: "Key insights into tax filing and returns.", imageName: "doc.text"),
        LearningItem(title: "Investments 101", itemDescription: "Start your journey into investing.", imageName: "chart.bar"),
        LearningItem(title: "Loans & Borrowing", itemDescription: "Tips for handling loans and credit responsibly.", imageName: "creditcard"),
        LearningItem(title: "Paycheck Breakdown", itemDescription: "Understand the components of your paycheck.", imageName: "calendar")
    ]

    var body: some View {
        NavigationView { // Wrap in NavigationView
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Large, featured item
                    LearningItemView(item: learningItems[0], isLarge: true)

                    // Horizontal scroll view
                    Text("Explore Topics")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(learningItems.dropFirst()) { item in
                                LearningItemView(item: item, isLarge: false)
                                    
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Learning Hub") // Set navigation title
        }
    }
}
