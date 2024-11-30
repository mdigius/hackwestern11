//
//  Item.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
    
}
