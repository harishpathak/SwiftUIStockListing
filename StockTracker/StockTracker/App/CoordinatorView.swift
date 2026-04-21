//
//  CoordinatorView.swift
//  StockTracker
//
//  Created by Harish on 16/04/2026.
//

import SwiftUI

struct CoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        // Access the binding using '$coordinator.path'
        NavigationStack(path: $coordinator.path) {
            coordinator.makeStockListView()
                .navigationDestination(for: Stock.self) { stock in
                    coordinator.makeStockDetailView(stock: stock)
                }
        }
    }
}
