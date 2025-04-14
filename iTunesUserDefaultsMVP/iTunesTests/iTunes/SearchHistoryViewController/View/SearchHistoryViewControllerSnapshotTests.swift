//
//  SearchHistoryViewControllerSnapshotTests.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 14.04.2025.
//

import XCTest
import SnapshotTesting
@testable import iTunesUserDefaultsMVP

final class SearchHistoryViewControllerSnapshotTests: XCTestCase {
    var viewController: SearchHistoryViewController!
    var mockPresenter: MockSearchHistoryPresenter!
    var mockDataSource: MockSearchHistoryDataSource!

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

    func testSnapshotInitialView() {
        let navigationController = UINavigationController(rootViewController: viewController)

        assertSnapshot(of: navigationController, as: .image)
    }

    func testSnapshotWithUpdatedData() {
        let searchHistory = ["Search1", "Search2"]

        let navigationController = UINavigationController(rootViewController: viewController)

        viewController.loadViewIfNeeded()
        viewController.updateSearchHistory(searchHistory)
        
        assertSnapshot(of: navigationController, as: .image)
    }
}
