//
//  ForumModels.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

import Foundation
import SwiftData

@Model
class Post {
    @Attribute(.unique) var id: UUID
    var title: String
    var body: String
    var dateCreated: Date
    var isAnonymous: Bool
    @Relationship var comments: [Comment]

    init(title: String, body: String, isAnonymous: Bool) {
        self.id = UUID()
        self.title = title
        self.body = body
        self.dateCreated = Date()
        self.isAnonymous = isAnonymous
        self.comments = []
    }
}

@Model
class Comment {
    @Attribute(.unique) var id: UUID
    var body: String
    var dateCreated: Date
    @Relationship var post: Post?

    init(body: String, post: Post?) {
        self.id = UUID()
        self.body = body
        self.dateCreated = Date()
        self.post = post
    }
}
