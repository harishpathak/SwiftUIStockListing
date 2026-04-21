//
//  WebSocketClient.swift
//  StockTracker
//
//  Created by Harish on 15/04/2026.
//

import SwiftUI

protocol WebSocketClientProtocol {
    func connect()
    func disconnect()
    func send(_ message: String)
}

class WebSocketClient: WebSocketClientProtocol {

    private var task: URLSessionWebSocketTask?

    func connect() {
        let url = URL(string: "wss://ws.postman-echo.com/raw")!
        task = URLSession.shared.webSocketTask(with: url)
        task?.resume()
        receive()
    }

    func disconnect() {
        task?.cancel(with: .goingAway, reason: nil)
    }

    func send(_ message: String) {
        task?.send(.string(message)) { _ in }
    }

    private func receive() {
        task?.receive { [weak self] result in
            self?.receive()
        }
    }
}
