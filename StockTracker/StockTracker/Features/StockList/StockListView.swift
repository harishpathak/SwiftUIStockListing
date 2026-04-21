//
//  StockListView.swift
//  StockTracker
//
//  Created by Harish on 16/04/2026.
//

import SwiftUI

struct StockListView: View {
    @ObservedObject var viewModel: StockListViewModel

    var body: some View {
        VStack {
            Text("To 25 Stocks")
                .font(.title2)
                .bold()
            
            HStack {
                Text(viewModel.feedActive ? "Connected" : "Offline")
                    .font(.headline)
                
                Spacer()
                
                Picker("Sort by", selection: $viewModel.selectedSort) {
                    ForEach(SortType.allCases, id: \.self) { type in
                        Text(type.title)
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
                
                FeedButton(state: viewModel.feedButtonState) {
                    viewModel.toggle()
                }
            }
            .padding(.horizontal)
            
            List(viewModel.stocks) { stock in
                NavigationLink(value: stock) {
                    HStack {
                        Text(stock.symbol)
                        Spacer()
                        Text(stock.displayPrice)
                            .foregroundStyle(stock.isGoingUp ? .green : .red)
                    }
                }
            }
        }
    }
}

#Preview {
    StockListView(viewModel: StockListViewModel(stockService: StockService(webSocketService: WebSocketService(client: WebSocketClient()), priceGenerator: PriceGenerator())))
}
