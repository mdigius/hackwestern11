//
//  ForumListView.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

//
//  ForumListView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

//
//  ForumListView.swift
//

import SwiftUI
import SwiftData

struct ForumListView: View {
    @Environment(\.modelContext) private var context: ModelContext
    @Query var posts: [Post]
    @State private var isPresentingCreatePost = false
    @State private var refreshID = UUID()

    init() {
        _posts = Query(sort: \.dateCreated, order: .reverse)
    }

    var body: some View {
        NavigationView {
            VStack {
                List(posts) { post in
                    NavigationLink(destination: PostDetailView(post: post)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(post.title)
                                    .font(.headline)
                                Text(post.isAnonymous ? "Anonymous" : "User")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text("\(post.comments.count) comments")
                                .font(.footnote)
                        }
                    }
                }
                .id(refreshID) // Force refresh when refreshID changes
                .navigationTitle("Forums")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isPresentingCreatePost.toggle()
                        }) {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $isPresentingCreatePost) {
                            CreatePostView(refreshID: $refreshID)
                        }
                    }
                }
            }
        }
    }
}
