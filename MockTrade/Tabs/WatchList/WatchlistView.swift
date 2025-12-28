//
//  WatchListView.swift
//  MockTrade
//
//  Created by Vedant on 21/12/25.
//

import SwiftUI

struct WatchlistView: View {
    
    let watchlists = [
        "WatchList 1",
        "Very Long WatchList 2",
        "WatchList 3",
        "My Custom WatchList 4",
        "WatchList 5"
    ]
    
    @State private var selectedIndex = 0
    let onSearchTapped: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Top Watchlist Tabs
            ScrollViewReader { scrollProxy in
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 24) {
                        ForEach(watchlists.indices, id: \.self) { index in
                            VStack(spacing: 6) {
                                
                                Text(watchlists[index])
                                    .font(.subheadline)
                                    .foregroundColor(
                                        selectedIndex == index ? .blue : .gray
                                    )
                                    .lineLimit(1)
                                    .fixedSize(horizontal: true, vertical: false)
                                
                                Rectangle()
                                    .fill(
                                        selectedIndex == index ? Color.blue : Color.clear
                                    )
                                    .frame(height: 2)
                            }
                            .id(index)
                            .onTapGesture {
                                withAnimation {
                                    selectedIndex = index
                                    scrollProxy.scrollTo(index, anchor: .center)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .onChange(of: selectedIndex) { _, newValue in
                    withAnimation {
                        scrollProxy.scrollTo(newValue, anchor: .center)
                    }
                }
            }
            
            Divider()
                .background(Color.primary)
            
            Button {
                onSearchTapped()
            } label: {
                Text("Search Stock")
                    .font(.body)
                    .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
                    .padding(.horizontal)
                    .background(Color(.secondarySystemBackground))
                    .foregroundColor(.secondary)
                    .cornerRadius(10)
                    .padding()
            }
            
            // MARK: - Swipeable Content
            TabView(selection: $selectedIndex) {
                ForEach(watchlists.indices, id: \.self) { index in
                    StockListView(
                        stocks: mockStocks(for: index)
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
    
    func mockStocks(for index: Int) -> [Stock] {
        (1...20).map {
            Stock(
                name: "Stock \($0) - WL \(index + 1)",
                price: Double.random(in: 100...500)
            )
        }
    }
}

#Preview {
    WatchlistView {
        print("Search tapped")
    }
}
