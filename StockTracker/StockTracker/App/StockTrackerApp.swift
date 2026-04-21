//
//  StockTrackerApp.swift
//  StockTracker
//
//  Created by Harish on 15/04/2026.
//

import SwiftUI

@main
struct StockTrackerApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            coordinator.start()
        }
    }
}
