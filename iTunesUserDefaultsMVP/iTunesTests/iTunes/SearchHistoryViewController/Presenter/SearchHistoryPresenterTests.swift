//
//  SearchHistoryPresenterTests.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 14.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsMVP

final class SearchHistoryPresenterTests: XCTestCase {
    private var presenter: SearchHistoryPresenter!
    private var mockView: MockSearchHistoryView!
    private var mockStorageManager: MockStorageManager!

    override func setUp() {
        super.setUp()
        mockStorageManager = MockStorageManager()
        mockView = MockSearchHistoryView()
        presenter = SearchHistoryPresenter(storageManager: mockStorageManager)
        presenter.view = mockView
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockStorageManager = nil
        super.tearDown()
    }

    func testViewDidLoadUpdatesSearchHistory() {
        let searchHistory = ["Search1", "Search2"]

        searchHistory.forEach { term in
            mockStorageManager.saveSearchTerm(term)
        }

        presenter.viewDidLoad()

        XCTAssertEqual(mockView.updatedSearchHistory, searchHistory)
    }
}
