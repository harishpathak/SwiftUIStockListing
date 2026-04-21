//
//  Stock.swift
//  StockTracker
//
//  Created by Harish on 15/04/2026.
//

import Foundation

struct Stock: Identifiable, Hashable {
    let id: String
    let symbol: String
    var price: Double
    var change: Double
    
    var displayPrice: String {
        "$\(String(format: "%.2f", price))"
    }

    var isGoingUp: Bool {
        change > 0
    }
}
