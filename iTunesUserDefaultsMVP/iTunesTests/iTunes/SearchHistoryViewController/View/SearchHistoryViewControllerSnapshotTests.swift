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

    func testDefaultAppearance() {
        let navigationController = UINavigationController(rootViewController: viewController)

        assertSnapshot(of: navigationController, as: .image)
    }

    func testAppearanceWithUpdatedData() {
        let searchHistory = ["Search1", "Search2"]

        let navigationController = UINavigationController(rootViewController: viewController)

        viewController.loadViewIfNeeded()
        viewController.updateSearchHistory(searchHistory)
        
        assertSnapshot(of: navigationController, as: .image)
    }
}
