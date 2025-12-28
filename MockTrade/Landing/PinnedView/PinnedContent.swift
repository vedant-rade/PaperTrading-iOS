//
//  PinnedContent1.swift
//  MockTrade
//
//  Created by Vedant on 28/12/25.
//

import SwiftUI

struct PinnedContent: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Nifty 50")
                .font(.title3)
                .foregroundStyle(.secondary)
            
            Text("26042.5")
                .font(.title)
                .foregroundStyle(.primary)
            
            HStack {
                Text("-99.08")
                    .font(.title3)
                    .foregroundStyle(.red)
                
                Text("-0.38%")
                    .font(.title3)
                    .foregroundStyle(.red)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PinnedContent()
}
