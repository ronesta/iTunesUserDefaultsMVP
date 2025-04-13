//
//  MockSearchPresenter.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 13.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsMVP

final class MockSearchPresenter: SearchPresenterProtocol {
    private(set) var didTypeSearchQuery: String?
    private(set) var searchButtonClickedTerm: String?
    private(set) var searchFromHistoryTerm: String?

    func didTypeSearch(_ searchQuery: String) {
        didTypeSearchQuery = searchQuery
    }

    func searchButtonClicked(with term: String?) {
        searchButtonClickedTerm = term
    }
    
    func searchFromHistory(with term: String) {
        searchFromHistoryTerm = term
    }
}
