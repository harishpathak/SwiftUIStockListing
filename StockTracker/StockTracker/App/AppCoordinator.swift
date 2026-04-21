//
//  AppCoordinator.swift
//  StockTracker
//
//  Created by Harish on 15/04/2026.
//

import SwiftUI
import Combine

class AppCoordinator: ObservableObject {

    @Published var path = NavigationPath()

    private let environment = AppEnvironment()
    
    @ViewBuilder
        func start() -> some View {
            // Use a local reference or 'self' to get the binding
            CoordinatorView(coordinator: self)
        }

    func makeStockListView() -> some View {
        let vm = StockListViewModel(stockService: environment.stockService)
        return StockListView(viewModel: vm)
    }

    func makeStockDetailView(stock: Stock) -> some View {
        let vm = StockDetailViewModel(
            stock: stock,
            stockService: environment.stockService
        )
        return StockDetailView(viewModel: vm)
    }
}
