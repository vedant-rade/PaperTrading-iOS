//
//  WatchListView.swift
//  MockTrade
//
//  Created by Vedant on 20/12/25.
//

import SwiftUI

struct HomeView: View {

    @State private var selectedTab: TabBarItem = .watchlist

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                tabContent()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                CustomTabBar(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
    
    @ViewBuilder
    private func tabContent() -> some View {
        switch selectedTab {
        case .watchlist:
            WatchListView()
        case .orders:
            OrdersView()
        case .portfolio:
            PortfolioView()
        case .analyze:
            AnalyzeView()
        case .profile:
            ProfileView()
        }
    }
}


#Preview {
    HomeView()
}
