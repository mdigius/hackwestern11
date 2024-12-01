//
//  EnabledScrollViewSwipeActionViewModifier.swift
//  hackwestern11
//
//  Created by Ali Elgalad on 2024-11-30.
//
import SwiftUI

struct ScrollViewSwipeActionModifier: ViewModifier
{
    @State private var size: CGSize = .init(width: 1, height: 1)
    
    func body(content: Content) -> some View
    {
        List{
            LazyVStack{
                content
            }.frame(minHeight:44)
                .readSize{ size in self.size = size}
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
        }
        .scrollDisabled(true)
        .listStyle(.plain)
        .frame(height: size.height)
        .contentMargins(.vertical,EdgeInsets(),for: .scrollContent)
        
    }

}

extension View{
    func enableScrollViewSwipeActions()-> some View
    {
        self.modifier(ScrollViewSwipeActionModifier())
    }
}
