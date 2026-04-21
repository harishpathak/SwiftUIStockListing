//
//  StockDetailView.swift
//  StockTracker
//
//  Created by Harish on 16/04/2026.
//

import SwiftUI

struct StockDetailView: View {

    @ObservedObject var viewModel: StockDetailViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.stock.symbol)
                .font(.largeTitle)

            Text("\(viewModel.stock.price)")

            Text(viewModel.isConnected ? "Connected" : "Disconnected")

            FeedButton(state: viewModel.feedButtonState) {
                viewModel.toggleConnection()
            }
        }
    }
}

#Preview {
    StockDetailView(viewModel: StockDetailViewModel(stock: Stock(id: "AAPL", symbol: "AAPL", price: 280.08, change: 1.0), stockService: StockService(webSocketService: WebSocketService(client: WebSocketClient()), priceGenerator: PriceGenerator())))
}
