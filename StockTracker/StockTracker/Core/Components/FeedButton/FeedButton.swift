//
//  FeedButton.swift
//  StockTracker
//
//  Created by Harish on 21/04/2026.
//

import SwiftUI

struct FeedButton: View {
    var state: FeedButtonState = .start
    let onClick: (() -> ())?
    var body: some View {
        Button {
            onClick?()
        } label: {
            HStack {
                Text(state.title)
                    .font(.headline)
                Image(systemName: state.imageName)
                    .font(.headline)
            }
            .padding(8)
            .foregroundStyle(.white)
            .background(state == .start ? .green : .red , in: RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    FeedButton(state: .start, onClick: nil)
}
