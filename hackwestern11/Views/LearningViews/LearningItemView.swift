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
                    Image(systemName: item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: isLarge ? 150 : 100, height: isLarge ? 150 : 100)
                        .padding()
                    
                    Text(item.title)
                        .font(isLarge ? .title : .headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .lineLimit(2)
                    
                    if isLarge {
                        Text(item.itemDescription)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
                
                
            }
        }
        .frame(maxWidth: isLarge ? .infinity : 120)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5), radius: 5)
        .padding(isLarge ? 16 : 8)
    }
}
