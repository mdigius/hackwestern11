//
//  Guide.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

import SwiftUI
import SwiftData

@Model
class Guide {
    var icon: String
    var title: String
    var subtitle: String
    var guideDescription: String // Add description

    init(icon: String, title: String, subtitle: String, guideDescription: String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.guideDescription = guideDescription
    }
}
