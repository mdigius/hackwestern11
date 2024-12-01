//
//  AttainedGoal.swift
//  hackwestern11
//
//  Created by Ali Elgalad on 2024-11-30.
//

import Foundation
import SwiftData
import SwiftUICore


@Model
final class AttainedGoal {
    var title: String

    init(title: String = "New Goal") {
        self.title = title
    }
}
