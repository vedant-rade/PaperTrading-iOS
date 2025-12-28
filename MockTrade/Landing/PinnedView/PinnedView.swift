//
//  PinnedView.swift
//  MockTrade
//
//  Created by Vedant on 28/12/25.
//

import SwiftUI

struct PinnedView: View {
    
    var navTitle: String
    @State private var isCollapsed = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(isCollapsed ? navTitle : "Overview")
                    .font(.largeTitle)
                Spacer()
                Button("", systemImage: isCollapsed ? "chevron.down" : "xmark") {
                    isCollapsed.toggle()
                }
            }
            
            if !isCollapsed {
                VStack(alignment: .leading, spacing: 15) {
                    HStack() {
                        PinnedContent()
                        PinnedContent()
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Funds")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        Text("₹45750.38")
                            .font(.title)
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
        .padding(.horizontal, 15)
        
    }
}

#Preview {
//    PinnedView(navTitle: "Overview")
    HomeView()
}
