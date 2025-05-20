//
//  SearchHistoryViewControllerTests.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 14.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsMVP

final class SearchHistoryViewControllerTests: XCTestCase {
    private var viewController: SearchHistoryViewController!
    private var mockPresenter: MockSearchHistoryPresenter!
    private var mockDataSource: MockSearchHistoryDataSource!

    override func setUp() {
        super.setUp()
        mockPresenter = MockSearchHistoryPresenter()
        mockDataSource = MockSearchHistoryDataSource()
        viewController = SearchHistoryViewController(
            presenter: mockPresenter,
            tableViewDataSource: mockDataSource
        )
    }

    override func tearDown() {
        viewController = nil
        mockPresenter = nil
        mockDataSource = nil
        super.tearDown()
    }

    func test_GivenViewController_WhenViewWillAppear_ThenPresenterViewDidLoadIsCalled() {
        // Given viewController with a mockPresenter

        // When
        viewController.viewWillAppear(false)

        // Then
        XCTAssertTrue(mockPresenter.viewDidLoadCalled)
    }

    func test_GivenSearchHistory_WhenUpdateSearchHistory_ThenTableViewDataSourceIsUpdated() {
        // Given
        let searchHistory = ["Search1", "Search2"]

        // When
        viewController.updateSearchHistory(searchHistory)

        // Then
        XCTAssertEqual(mockDataSource.searchHistory, searchHistory)
    }
}
