//
//  Goal.swift
//  hackwestern11
//
//  Created by Ali Elgalad on 2024-11-30.
//

import Foundation
import SwiftData
import SwiftUICore


@Model
final class Goal {
    var title: String
    var completed: Bool = false
    var type: String
    var totalAmount: Double = 0.0
    var currentAmount: Double = -1.0
    var cost: Double = -1.0
    var frequency: String = "Daily"
    var totalSavings: Double = 0.0
    var image: String = "figure.mind.and.body"

    init(title: String = "New Goal", type: String = "Personal") {
        self.type = type
        self.title = title
    }
    
}
