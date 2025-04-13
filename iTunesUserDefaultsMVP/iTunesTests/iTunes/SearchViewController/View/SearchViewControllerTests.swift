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

    func testSearchBarButtonClickedTriggersSearch() {
        let term = "Test Search"

        viewController.searchBar.text = term
        viewController.searchBarSearchButtonClicked(viewController.searchBar)

        XCTAssertEqual(mockPresenter.searchButtonClickedTerm, term)
    }

    func testSearchBarTextDidChange() {
        let term = "New Search"

        viewController.searchBar(viewController.searchBar, textDidChange: term)

        XCTAssertEqual(mockPresenter.didTypeSearchQuery, term)
    }


    func testUpdateAlbumsReloadsData() {
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

        viewController.updateAlbums(albums)

        XCTAssertEqual(mockDataSource.albums, albums)
    }

    @MainActor func testShowErrorDisplaysAlert() {
        let errorMessage = "Test Error"
        let alertVerifier = AlertVerifier()

        viewController.showError(errorMessage)

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
}
