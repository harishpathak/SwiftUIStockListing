//
//  PriceGenerator.swift
//  StockTracker
//
//  Created by Harish on 15/04/2026.
//

class PriceGenerator {

    func generatePrice(from current: Double) -> Double {
        let change = Double.random(in: -2...2)
        return max(1, current + change)
    }
}
