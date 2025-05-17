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

    func test_GivenEmptySearchHistory_WhenViewLoaded_ThenViewControllerAppearanceMatchesSnapshot() {
        // Given
        let navigationController = UINavigationController(rootViewController: viewController)

        // When
        viewController.loadViewIfNeeded()

        // Then
        assertSnapshot(of: navigationController, as: .image)
    }

    func test_GivenSearchHistory_WhenUpdateSearchHistoryCalled_ThenViewControllerAppearanceMatchesSnapshot() {
        // Given
        let searchHistory = ["Search1", "Search2"]
        let navigationController = UINavigationController(rootViewController: viewController)

        // When
        viewController.loadViewIfNeeded()
        viewController.updateSearchHistory(searchHistory)

        // Then
        assertSnapshot(of: navigationController, as: .image)
    }
}
