//
//  SearchViewControllerTests.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 13.04.2025.
//

import XCTest
import ViewControllerPresentationSpy
@testable import iTunesUserDefaultsMVP

final class SearchViewControllerTests: XCTestCase {
    private var viewController: SearchViewController!
    private var mockPresenter: MockSearchPresenter!
    private var mockDataSource: MockSearchDataSource!

    override func setUp() {
        super.setUp()
        mockPresenter = MockSearchPresenter()
        mockDataSource = MockSearchDataSource()
        viewController = SearchViewController(
            presenter: mockPresenter,
            collectionViewDataSource: mockDataSource
        )
    }

    override func tearDown() {
        viewController = nil
        mockPresenter = nil
        mockDataSource = nil
        super.tearDown()
    }

    func test_GivenSearchBar_WhenSearchButtonClicked_ThenPresenterReceivesSearchTerm() {
        // Given
        let term = "Test Search"
        viewController.searchBar.text = term

        // When
        viewController.searchBarSearchButtonClicked(viewController.searchBar)

        // Then
        XCTAssertEqual(mockPresenter.searchButtonClickedCallCount, 1)
        XCTAssertEqual(mockPresenter.searchButtonClickedArgsTerms.first, term)
    }

    func test_GivenSearchBar_WhenTextDidChange_ThenPresenterReceivesTypedQuery() {
        // Given
        let term = "New Search"

        // When
        viewController.searchBar(viewController.searchBar, textDidChange: term)

        // Then
        XCTAssertEqual(mockPresenter.didTypeSearchCallCount, 1)
        XCTAssertEqual(mockPresenter.didTypeSearchArgsQueries.first, term)
    }

    func test_GivenAlbums_WhenUpdateAlbumsCalled_ThenDataSourceIsUpdated() {
        // Given
        let albums = [
            Album(artistId: 111051,
                  artistName: "Eminem",
                  collectionName: "The Eminem Show",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 10.99
                 ),
            Album(artistId: 20044,
                  artistName: "Eminem",
                  collectionName: "Levitating",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 9.99
                 )
        ]

        // When
        viewController.updateAlbums(albums)

        // Then
        XCTAssertEqual(mockDataSource.albums, albums)
    }

    @MainActor
    func test_GivenError_WhenShowErrorCalled_ThenAlertIsDisplayed() {
        // Given
        let errorMessage = "Test Error"
        let alertVerifier = AlertVerifier()

        // When
        viewController.showError(errorMessage)

        // Then
        alertVerifier.verify(
            title: "Error",
            message: "Test Error",
            animated: true,
            actions: [
                .default("OK")
            ],
            presentingViewController: viewController
        )
    }

    func test_GivenSearchQueryInHistory_WhenPerformSearchCalled_ThenSearchBarIsHiddenAndPresenterIsCalled() {
        // Given
        let term = "SomeTerm"
        viewController.searchBar.isHidden = false

        // When
        viewController.performSearch(with: term)

        // Then
        XCTAssertTrue(viewController.searchBar.isHidden)
        XCTAssertEqual(mockPresenter.searchFromHistoryCallCount, 1)
        XCTAssertEqual(mockPresenter.searchFromHistoryArgsTerms.first, term)
    }
}
