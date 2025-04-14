//
//  MockSearchHistoryView.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 14.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsMVP

final class MockSearchHistoryView: SearchHistoryViewProtocol {
    private(set) var updatedSearchHistory: [String]?

    func updateSearchHistory(_ history: [String]) {
        updatedSearchHistory = history
    }
}
