import SwiftUI
import Auth0
import JWTDecode

struct ProfileView: View {
    let user: User

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.picture))
            Text("Email: \(user.email)")
        }
    }
}

struct LoginView: View {
    @Binding var user: User
    init(user: Binding<User>) {
        self._user = user
    }
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 15) {
                Text("Welcome to Shitty Finance App!")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                    .padding(.top, 50)
                Text("Register or login below to continue")
                    .font(.title3)
                Spacer()
                Image(systemName: "graduationcap")
                    .font(.system(size: 144, weight: .black))
                    .foregroundStyle(
                        MeshGradient(width: 2, height: 2, points: [
                            [0, 0], [1, 0],
                            [0, 1], [1, 1]
                        ], colors: [
                            .indigo, .cyan,
                            .purple, .pink
                        ])
                    )
                
                Spacer()
                
                Button(action: {
                    login()
                }, label: {
                    Text("Continue")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 50)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.blue.gradient)
                        }
                })
                .padding(.bottom)
            }
            .padding(.top, 50)
        }
    }
}

extension LoginView {
    func login() {
        Auth0
            .webAuth()
            .useHTTPS() // Use a Universal Link callback URL on iOS 17.4+ / macOS 14.4+
            .start { result in
                switch result {
                case .success(let credentials):
                    print("Obtained credentials: \(credentials)")

                    // Directly access idToken since it's non-optional
                    let idToken = credentials.idToken
                    print("idToken found: \(idToken)")

                    // Use the custom initializer to create a User object from the idToken
                    if let tempUser = User(from: idToken) {
                        // Call the onLogin closure to pass user back to ContentView
                        
                        self.user = tempUser
                    } else {
                        print("Failed to create User from idToken")
                    }

                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
}
