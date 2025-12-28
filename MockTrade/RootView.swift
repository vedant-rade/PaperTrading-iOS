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
            HomeView()
        } else {
            LoginView {
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    RootView()
}
