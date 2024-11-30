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

                Text(item.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(item.itemDescription)
                    .font(.body)
                    .padding(.vertical)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(item.title)
    }
}
