//
//  GuideInfoView.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

import SwiftUI

struct GuideInfoView: View {
    let guide: Guide
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Icon
                Image(systemName: guide.icon)
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
                
                // Subtitle
                Text(guide.subtitle)
                    .font(.title)
                    .padding(.vertical)
                    .fontWeight(.semibold)
                
                // Description
                Text(guide.guideDescription)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
            }
            .padding()
        }
        .navigationTitle(guide.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
