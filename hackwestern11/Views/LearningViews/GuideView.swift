//
//  GuideView.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

import SwiftUI
import SwiftData

struct GuideView: View {
    var guide: Guide
    
    var body: some View {
        ZStack(){
            RoundedRectangle(cornerRadius: 15)
                .shadow(color: .black.opacity(0.5), radius: 2)
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
