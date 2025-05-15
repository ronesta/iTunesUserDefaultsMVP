//
//  MockSearchPresenter.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 13.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsMVP

final class MockSearchPresenter: SearchViewOutputProtocol {
    private(set) var didTypeSearchCallCount = 0
    private(set) var didTypeSearchArgsQueries = [String]()

    private(set) var searchButtonClickedCallCount = 0
    private(set) var searchButtonClickedArgsTerms = [String?]()

    private(set) var searchFromHistoryCallCount = 0
    private(set) var searchFromHistoryArgsTerms = [String]()

    func didTypeSearch(_ searchQuery: String) {
        didTypeSearchCallCount += 1
        didTypeSearchArgsQueries.append(searchQuery)
    }

    func searchButtonClicked(with term: String?) {
        searchButtonClickedCallCount += 1
        searchButtonClickedArgsTerms.append(term)
    }

    func searchFromHistory(with term: String) {
        searchFromHistoryCallCount += 1
        searchFromHistoryArgsTerms.append(term)
    }
}
