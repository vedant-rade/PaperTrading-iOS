//
//  StockListView.swift
//  MockTrade
//
//  Created by Vedant on 28/12/25.
//

import SwiftUI

struct StockListView: View {

    let stocks: [Stock]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(stocks) { stock in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(stock.name)
                                .foregroundStyle(.primary)
                                .font(.title3)
                            Text("NSE")
                                .foregroundStyle(.secondary)
                                .font(.footnote)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("\(stock.price, specifier: "%.2f")")
                                .foregroundStyle(.primary)
                                .font(.title3)
                            Text("\(-4.70, specifier: "%.2f") (\(-0.47, specifier: "%.2f")%)")
                                .foregroundStyle(.secondary)
                                .font(.footnote)
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 1)
                }
            }
            .padding()
        }
    }
}

#Preview {
    StockListView(stocks: [Stock(name: "Reliance", price: 1500.05)])
}
