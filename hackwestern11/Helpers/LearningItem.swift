//
//  LearningItem.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

import SwiftUI
import SwiftData

@Model
class LearningItem {
    @Attribute(.unique) var id: UUID
    var title: String
    var itemDescription: String
    var imageName: String
    var learningText: String

    init(title: String, itemDescription: String, imageName: String, learningText: String) {
        self.id = UUID()
        self.title = title
        self.itemDescription = itemDescription
        self.imageName = imageName
        self.learningText = learningText
    }
}
