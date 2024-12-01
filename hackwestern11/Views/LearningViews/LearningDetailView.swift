//
//  LearningDetailView.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//
import SwiftUI

struct LearningDetailView: View {
    let item: LearningItem

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(systemName: item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: 200)
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

                Text(item.itemDescription)
                    .font(.title)
                    .padding(.vertical)
                    .fontWeight(.semibold)

                Text(item.learningText)
                    .font(.body)
                    .padding(.vertical)
                
            }
            .padding()
        }
        .navigationTitle(item.title)
    }
}
