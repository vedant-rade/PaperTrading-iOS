//
//  SwiftUIView.swift
//  MockTrade
//
//  Created by Vedant on 21/12/25.
//

enum TabBarItem: Int, CaseIterable {
    case watchlist
    case orders
    case portfolio
    case analyze
    case profile

    var title: String {
        switch self {
        case .watchlist: return "Watchlist"
        case .orders: return "Orders"
        case .portfolio: return "Portfolio"
        case .analyze: return "Analyze"
        case .profile: return "Profile"
        }
    }

    var icon: String {
        switch self {
        case .watchlist: return "list.bullet"
        case .orders: return "doc.text"
        case .portfolio: return "briefcase"
        case .analyze: return "chart.line.uptrend.xyaxis"
        case .profile: return "person"
        }
    }
}

import SwiftUI

struct CustomTabBar: View {

    @Binding var selectedTab: TabBarItem

    var body: some View {
        HStack {
            ForEach(TabBarItem.allCases, id: \.self) { tab in
                Spacer()

                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 18, weight: .semibold))

                        Text(tab.title)
                            .font(.caption2)
                    }
                    .foregroundStyle(
                        selectedTab == tab ? .blue : .gray
                    )
                }

                Spacer()
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 12)
        .background(
            Color(.systemBackground)
                .shadow(color: .black.opacity(0.1), radius: 4, y: -2)
        )
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.watchlist))
}
