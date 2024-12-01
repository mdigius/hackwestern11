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

                // EntryType and Image side by side
                HStack(alignment: .center, spacing: 8) {
                    Text(entry.entryType)
                        .font(.headline)
                        .foregroundColor(.gray)

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

                if entry.amount != "0.00" {
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
