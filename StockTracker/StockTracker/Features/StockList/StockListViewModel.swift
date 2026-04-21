//
//  StockListViewModel.swift
//  StockTracker
//
//  Created by Harish on 16/04/2026.
//

import SwiftUI
import Combine

class StockListViewModel: ObservableObject {

    @Published var stocks: [Stock] = []
    @Published var selectedSort: SortType = .price
    @Published var feedActive: Bool = false

    var feedButtonState: FeedButtonState {
        stockService.isConnected ? .stop : .start
    }

    private let stockService: StockService
    private var cancellables = Set<AnyCancellable>()

    init(stockService: StockService) {
        self.stockService = stockService
        bind()
    }

    private func bind() {
        Publishers.CombineLatest(stockService.$stocks, $selectedSort)
            .map { stocks, sortType in
                return self.performSort(stocks: stocks, by: sortType)
            }
            .receive(on: DispatchQueue.main)
            .assign(to: &$stocks)
        
        stockService.$isConnected
            .receive(on: DispatchQueue.main)
            .assign(to: &$feedActive)
    }

    func toggle() {
        stockService.isConnected ? stockService.stop() : stockService.start()
    }

    private func performSort(stocks: [Stock], by type: SortType) -> [Stock] {
        switch type {
        case .price:
            return stocks.sorted { $0.price > $1.price }
        case .change:
            return stocks.sorted { $0.change < $1.change }
        }
    }
}
