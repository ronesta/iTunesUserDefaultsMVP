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

    func testViewWillAppearCallsPresenterViewDidLoad() {
        viewController.viewWillAppear(true)

        XCTAssertTrue(mockPresenter.viewDidLoadCalled)
    }

    func testUpdateSearchHistoryUpdatesData() {
        let searchHistory = ["Search1", "Search2"]
        viewController.updateSearchHistory(searchHistory)

        XCTAssertEqual(mockDataSource.searchHistory, searchHistory)
    }
}
