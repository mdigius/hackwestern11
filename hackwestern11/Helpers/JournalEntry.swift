//
//  JournalEntry.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

import SwiftData
import Foundation

@Model
class JournalEntry {
    @Attribute(.unique) var id: UUID
    var title: String
    var entryType: String
    var amount: String
    var dateCreated: Date
    var entryText: String
    
    init(title: String, entryType: String, amount: String, entryText: String) {
        self.id = UUID()
        self.title = title
        self.entryType = entryType
        self.amount = amount
        self.dateCreated = Date()
        self.entryText = entryText
    }
}