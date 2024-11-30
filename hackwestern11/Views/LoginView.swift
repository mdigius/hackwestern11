//
//  LoginView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

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
    @State var user: User?

    var body: some View {
        if let user = self.user {
            VStack {
                ProfileView(user: user)
                Button("Logout", action: self.logout)
            }
        } else {
            Button("Login", action: self.login)
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
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }

    func logout() {
        Auth0
            .webAuth()
            .useHTTPS() // Use a Universal Link logout URL on iOS 17.4+ / macOS 14.4+
            .clearSession { result in
                switch result {
                case .success:
                    self.user = nil
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
}

#Preview {
    LoginView()
}
