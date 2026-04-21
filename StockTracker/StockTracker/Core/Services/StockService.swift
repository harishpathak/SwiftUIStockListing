//
//  StockService.swift
//  StockTracker
//
//  Created by Harish on 15/04/2026.
//

import SwiftUI
import Combine

class StockService: ObservableObject {

    @Published private(set) var stocks: [Stock] = []
    @Published private(set) var isConnected = false

    private let webSocketService: WebSocketService
    private let priceGenerator: PriceGenerator

    private var timer: Timer?

    init(webSocketService: WebSocketService,
         priceGenerator: PriceGenerator) {
        self.webSocketService = webSocketService
        self.priceGenerator = priceGenerator

        setupInitialStocks()
    }

    func start() {
        isConnected = true
        webSocketService.connect()
        startTimer()
    }

    func stop() {
        isConnected = false
        webSocketService.disconnect()
        timer?.invalidate()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.updateRandomStock()
        }
    }

    private func updateRandomStock() {
        guard let index = stocks.indices.randomElement() else { return }

        var stock = stocks[index]
        let newPrice = priceGenerator.generatePrice(from: stock.price)

        stock.change = newPrice - stock.price
        stock.price = newPrice

        stocks[index] = stock
    }

    private func setupInitialStocks() {
        stocks = [
            Stock(id: "NVDA", symbol: "NVDA", price: 145, change: 0),
            Stock(id: "GOOG", symbol: "GOOG", price: 2850, change: 0),
            Stock(id: "AAPL", symbol: "AAPL", price: 242, change: -0.15),
            Stock(id: "MSFT", symbol: "MSFT", price: 435, change: 0),
            Stock(id: "AMZN", symbol: "AMZN", price: 198, change: 3.10),
            Stock(id: "AVGO", symbol: "AVGO", price: 1820, change: 0),
            Stock(id: "META", symbol: "META", price: 585, change: -2.60),
            Stock(id: "TSLA", symbol: "TSLA", price: 265, change: 0),
            Stock(id: "BRK.B", symbol: "BRK.B", price: 485, change: 0),
            Stock(id: "WMT", symbol: "WMT", price: 92, change: 0),
            Stock(id: "JPM", symbol: "JPM", price: 225, change: 0),
            Stock(id: "LLY", symbol: "LLY", price: 950, change: 0),
            Stock(id: "XOM", symbol: "XOM", price: 135, change: 2.10),
            Stock(id: "V", symbol: "V", price: 310, change: 0),
            Stock(id: "JNJ", symbol: "JNJ", price: 175, change: 0),
            Stock(id: "MU", symbol: "MU", price: 165, change: 0),
            Stock(id: "ORCL", symbol: "ORCL", price: 185, change: 0),
            Stock(id: "MA", symbol: "MA", price: 540, change: 0),
            Stock(id: "AMD", symbol: "AMD", price: 215, change: 0),
            Stock(id: "COST", symbol: "COST", price: 940, change: 0),
            Stock(id: "NFLX", symbol: "NFLX", price: 710, change: -2.60),
            Stock(id: "PLTR", symbol: "PLTR", price: 65, change: 0),
            Stock(id: "ABBV", symbol: "ABBV", price: 210, change: 0),
            Stock(id: "BAC", symbol: "BAC", price: 48, change: 0),
            Stock(id: "INTC", symbol: "INTC", price: 35, change: 0)
        ]
    }
}
