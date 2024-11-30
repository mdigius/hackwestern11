//
//  PostDetailView.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

import SwiftUI
import SwiftData

struct PostDetailView: View {
    @Environment(\.modelContext) private var context: ModelContext
    @State private var commentBody = ""
    var post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Post title and poster name
            Text(post.title)
                .font(.largeTitle)
            Text(post.isAnonymous ? "Anonymous" : "User")
                .font(.subheadline)
                .foregroundColor(.gray)

            // Post body
            Text(post.body)
                .font(.body)
                .padding(.vertical)

            // Comments section
            Text("Comments")
                .font(.headline)
            List(post.comments) { comment in
                Text(comment.body)
                    .padding(.vertical, 4)
            }

            // Add comment
            HStack {
                TextField("Write a comment...", text: $commentBody)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Post") {
                    addComment()
                }
                .disabled(commentBody.isEmpty)
            }
            .padding(.top)

            Spacer()
        }
        .padding()
        .navigationTitle("Post Details")
    }

    private func addComment() {
        let newComment = Comment(body: commentBody, post: post)
        context.insert(newComment)
        post.comments.append(newComment)  // Associate comment with the post
        commentBody = ""
    }
}
