//
//  JournalListView.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

import SwiftUI
import SwiftData

struct JournalListView: View {
    @Environment(\.modelContext) private var context: ModelContext
    @Query var journalEntries: [JournalEntry]
    @State private var isPresentingCreateView = false
    @State private var refreshID = UUID()
    
    init() {
        _journalEntries = Query(sort: \.dateCreated, order: .reverse)
    }
    
    var body: some View {
        
        ZStack(){
            NavigationView {
                VStack {
                    List(journalEntries) { entry in
                        NavigationLink(destination: EntryDetailView(entry: entry)) {
                            HStack {
                                // Left VStack for text content
                                VStack(alignment: .leading) {
                                    Text(entry.title)
                                        .font(.headline)
                                    Text(entry.entryType)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text(entry.dateCreated, format: .dateTime.year().month().day())
                                        .font(.footnote)
                                }
                                
                                Spacer() // Add space between the VStacks
                                
                                // Right VStack for image
                                VStack {
                                    Image(entry.imageString)
                                        .renderingMode(.template)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30) // Adjusted size
                                        .padding(4)
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
                        }
                    }
                    .id(refreshID)
                    .navigationTitle("Journal")
                }
            }
            
            
            // Floating Add Button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        isPresentingCreateView.toggle()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                            .foregroundStyle(
                                MeshGradient(width: 2, height: 2, points: [
                                    [0, 0], [1, 0],
                                    [0, 1], [1, 1]
                                ], colors: [
                                    .indigo, .cyan,
                                    .purple, .pink
                                ])
                            )
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                    }
                    .padding()
                    .sheet(isPresented: $isPresentingCreateView) {
                        CreateJournalView(refreshID: $refreshID)
                    }
                }
            }
            .onAppear {
                addHardcodedEntries()
            }
        }
    }
    func addHardcodedEntries() {
        if journalEntries.isEmpty {
            // Add hard coded entries to the list display for demo purposes
            let hardcodedEntries: [JournalEntry] = [
                JournalEntry(
                    title: "Reflecting on an unnecessary purchase",
                    entryType: "Purchase Reflection",
                    amount: "50.00",
                    entryText: "I spent $50 on a new tech gadget for my iPhone. While I love it, I need to be more mindful of impulse purchases. Next time, I am going to do better!",
                    imageString: "neutralface"
                ),
                JournalEntry(
                    title: "I reached my savings milestone!",
                    entryType: "Savings Reflection",
                    amount: "2000.00",
                    entryText: "I reached my $2,000 savings goal! I feel great knowing that I have been financially responsible and that I have the discipline and self control to achieve this?",
                    imageString: "happyface"
                ),
                JournalEntry(
                    title: "Adjusting my budget to pay off student loans faster",
                    entryType: "Budget Adjustment",
                    amount: "0.00",
                    entryText: "Revised my monthly budget to allocate more toward paying off my student loans faster. As a new grad, it is one of my highest priorities to pay off my student loan!",
                    imageString: "happyface"
                )
            ]
            
            Task {
                for entry in hardcodedEntries {
                    context.insert(entry) // Insert into ModelContext
                }
            }
        }
    }
    
}
