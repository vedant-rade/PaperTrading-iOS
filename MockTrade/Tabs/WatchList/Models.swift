//
//  Models.swift
//  MockTrade
//
//  Created by Vedant on 28/12/25.
//

import Foundation

struct Stock: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
}
