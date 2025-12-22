//
//  ContentView.swift
//  MockTrade
//
//  Created by Vedant on 20/12/25.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isLoggedIn: Bool
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
            VStack {
                
                TextField("Enter username", text: $username)
                    .foregroundStyle(.gray)
                    .frame(height: 45)
                    .padding(.horizontal)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1)
                        )
                    .padding(.vertical, 10)
                
                SecureField("Enter Password", text: $password)
                    .foregroundStyle(.gray)
                    .frame(height: 45)
                    .padding(.horizontal)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1)
                        )
                
                Button {
                    isLoggedIn = true
                } label: {
                    Text("Login")
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical, 30)
                .navigationDestination(for: String.self) { value in
                    if value == "login" {
                        HomeView()
                    }
                }
            }
            .padding()
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
