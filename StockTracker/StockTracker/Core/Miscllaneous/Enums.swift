//
//  Enums.swift
//  StockTracker
//
//  Created by Harish on 15/04/2026.
//

import SwiftUI

enum SortType: Int, CaseIterable {
    case price
    case change
    
    var title: String {
        switch self {
        case .price:
            "Price"
        case .change:
            "Change"
        }
    }
}

enum FeedButtonState {
    case start
    case stop
    
    var title: String {
        switch self {
        case .start:
            "Start"
        case .stop:
            "Stop"
        }
    }

    var imageName: String {
        switch self {
        case .start:
            "play.fill"
        case .stop:
            "stop.fill"
        }
    }
}
