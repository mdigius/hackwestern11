//
//  CreatePostView.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

import SwiftUI
import SwiftData

struct CreatePostView: View {
    @Environment(\.modelContext) private var context: ModelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var postContent = ""
    
    @Binding var refreshID: UUID
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Post Title")) {
                    TextField("Enter title", text: $title)
                }
                
                Section(header: Text("Post Body")) {
                    TextEditor(text: $postContent)
                        .frame(height: 150)
                }
            }
            .navigationTitle("Create Post")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        createPost()
                        dismiss()
                    }
                    .disabled(title.isEmpty || postContent.isEmpty)
                }
            }
        }
    }
    private func createPost() {
        let newPost = Post(title: title, body: postContent, isAnonymous: true)
        newPost.dateCreated = Date()
        context.insert(newPost)
        refreshID = UUID()
    }
}
