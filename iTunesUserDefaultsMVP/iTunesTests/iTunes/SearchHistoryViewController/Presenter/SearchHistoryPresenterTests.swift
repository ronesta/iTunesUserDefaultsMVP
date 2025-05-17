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

    func test_GivenSavedSearchTerms_WhenViewDidLoad_ThenSearchHistoryIsUpdated() {
        // Given
        let searchHistory = ["Search1", "Search2"]

        searchHistory.forEach { term in
            mockStorageManager.saveSearchTerm(term)
        }

        // When
        presenter.viewDidLoad()

        // Then
        XCTAssertEqual(mockView.updateSearchHistoryCallCount, 1)
        XCTAssertEqual(mockView.updateSearchHistoryArgsHistory.first, searchHistory)
    }
}
