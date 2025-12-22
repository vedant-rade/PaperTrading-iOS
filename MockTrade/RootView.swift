//
//  RootView.swift
//  MockTrade
//
//  Created by Vedant on 21/12/25.
//

import SwiftUI

struct RootView: View {
    
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            NavigationStack {
                HomeView()
            }
        } else {
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

#Preview {
    RootView()
}
