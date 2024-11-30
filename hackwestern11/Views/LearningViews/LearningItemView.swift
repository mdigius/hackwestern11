//
//  LearningItemView.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//
import SwiftUI

struct LearningItemView: View {
    let item: LearningItem
    let isLarge: Bool

    var body: some View {
        ZStack {
            NavigationLink(destination: LearningDetailView(item: item)) {
                VStack {
                    Spacer()
                    Image(systemName: item.imageName)
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.light)
                        .foregroundStyle(
                            MeshGradient(width: 2, height: 2, points: [
                                [0, 0], [1, 0],
                                [0, 1], [1, 1]
                            ], colors: [
                                .indigo, .cyan,
                                .purple, .pink
                            ])
                        )
                        .padding(.top, 10)
                        .padding()
                    
                    Spacer()
                    Text(item.title)
                        .font(isLarge ? .title : .title2)
                        .foregroundStyle(.black)
                        .padding(isLarge ? 0 : 15)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                       
                       
                    
                    if isLarge {
                        Text(item.itemDescription)
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                            .lineLimit(2)
                    }
                }
                
                
            }
        }
        .frame(maxWidth: isLarge ? .infinity : 240)
        .frame(minWidth: isLarge ? 240 : 240)
        .frame(height: isLarge ? 240 : 220)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: .black.opacity(0.5), radius: 5)
        .padding(isLarge ? 16 : 8)
    }
}

#Preview {
    LearningView()
}
