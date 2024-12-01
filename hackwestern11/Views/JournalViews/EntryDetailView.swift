//
//  EntryDetailView.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

import SwiftUI

struct EntryDetailView: View {
    let entry: JournalEntry
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(entry.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(entry.entryType)
                    .font(.headline)
                    .foregroundColor(.gray)
                
                if(entry.amount != "0.00") {
                    Text("Purchase Amount: \(entry.amount)")
                        .font(.body)
                }
                
                Text("Created: \(entry.dateCreated)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text(entry.entryText)
                    .font(.body)
                    .padding(.top)
            }
            .padding()
        }
        .navigationTitle(entry.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
