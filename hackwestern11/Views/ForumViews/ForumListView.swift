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
            ZStack {
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
                }
                
                // Floating Add Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            isPresentingCreatePost.toggle()
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                                .foregroundStyle(
                                    MeshGradient(width: 2, height: 2, points: [
                                        [0, 0], [1, 0],
                                        [0, 1], [1, 1]
                                    ], colors: [
                                        .indigo, .cyan,
                                        .purple, .pink
                                    ])
                                )
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                        }
                        .padding()
                        .sheet(isPresented: $isPresentingCreatePost) {
                            CreatePostView(refreshID: $refreshID)
                        }
                    }
                }
            }
        }
    }
}
