//
//  ScrollViewAction.swift
//  hackwestern11
//
//  Created by Ali Elgalad on 2024-11-30.
//
import SwiftUI

private struct SizePreferenceKey: PreferenceKey
{
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}

}

extension View
{
    func readSize(onChange: @escaping (CGSize)-> Void) -> some View
    {
        background(
            GeometryReader
            {
                geometryproxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryproxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}
