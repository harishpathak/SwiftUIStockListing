//
//  WebSocketService.swift
//  StockTracker
//
//  Created by Harish on 15/04/2026.
//

class WebSocketService {

    private let client: WebSocketClientProtocol

    var onMessageReceived: ((String) -> Void)?

    init(client: WebSocketClientProtocol) {
        self.client = client
    }

    func connect() {
        client.connect()
    }

    func disconnect() {
        client.disconnect()
    }

    func send(message: String) {
        client.send(message)
    }
}
