//
//  StockDetailViewModel.swift
//  StockTracker
//
//  Created by Harish on 16/04/2026.
//

import SwiftUI
import Combine

class StockDetailViewModel: ObservableObject {

    @Published var stock: Stock
    @Published var isConnected: Bool = false
    var feedButtonState: FeedButtonState {
        isConnected ? .stop : .start
    }
    
    private let stockService: StockService
    private var cancellables = Set<AnyCancellable>()

    init(stock: Stock, stockService: StockService) {
        self.stock = stock
        self.stockService = stockService

        bind()
    }

    private func bind() {
        stockService.$stocks
            .sink { [weak self] stocks in
                guard let self else { return }
                self.stock = stocks.first { $0.id == self.stock.id } ?? self.stock
            }
            .store(in: &cancellables)

        stockService.$isConnected
            .assign(to: &$isConnected)
    }

    func toggleConnection() {
        if isConnected {
            stockService.stop()
        } else {
            stockService.start()
        }
    }
}
