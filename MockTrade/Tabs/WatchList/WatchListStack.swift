//
//  WatchListStack.swift
//  MockTrade
//
//  Created by Vedant on 28/12/25.
//

import SwiftUI

struct WatchListStack: View {
    
    @State private var showSearch = false
    
    var body: some View {
        NavigationStack {
            WatchlistView {
                showSearch = true
            }
            .navigationDestination(isPresented: $showSearch) {
                SearchView()
            }
        }
    }
}

#Preview {
    WatchListStack()
}
