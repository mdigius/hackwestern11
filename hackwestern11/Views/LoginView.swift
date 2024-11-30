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
            ZStack {
                VStack(alignment: .center, spacing: 15) {
                    Text("Welcome to ____!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.bottom, 10)
                        .padding(.top, 50)
                    Text("Register or login below to continue")
                        .font(.title3)
                        
                    Spacer()
                    
                    Button(action: {
                        login()
                    }, label: {
                        Text("Register")
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
