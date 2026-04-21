//
//  AppEnvironment.swift
//  StockTracker
//
//  Created by Harish on 16/04/2026.
//

import SwiftUI

class AppEnvironment {

    let stockService: StockService

    init() {
        let webSocket = WebSocketService(
            client: WebSocketClient()
        )
        let generator = PriceGenerator()

        self.stockService = StockService(
            webSocketService: webSocket,
            priceGenerator: generator
        )
    }
}
