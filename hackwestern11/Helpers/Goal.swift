//
//  Goal.swift
//  hackwestern11
//
//  Created by Ali Elgalad on 2024-11-30.
//

import Foundation
import SwiftData

@Model
final class Goal {
    var title: String

    init(title: String) {
        self.title = title
    }
}
