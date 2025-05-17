//
//  SearchPresenterTests.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 13.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsMVP

final class SearchPresenterTests: XCTestCase {
    private var presenter: SearchPresenter!
    private var mockView: MockSearchView!
    private var mockITunesService: MockITunesService!
    private var mockStorageManager: MockStorageManager!

    override func setUp() {
        super.setUp()
        mockView = MockSearchView()
        mockITunesService = MockITunesService()
        mockStorageManager = MockStorageManager()
        presenter = SearchPresenter(iTunesService: mockITunesService,
                                    storageManager: mockStorageManager
        )
        presenter.view = mockView
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockITunesService = nil
        mockStorageManager = nil
        super.tearDown()
    }

    func test_GivenSearchTerm_WhenDidTypeSearch_ThenServiceReceivesTerm() {
        // Given
        let term = "SomeAlbum"

        // When
        presenter.didTypeSearch(term)

        // Then
        XCTAssertEqual(mockITunesService.loadAlbumsArgsTerms.first, term)
    }

    func test_GivenSearchTerm_WhenSearchButtonClicked_ThenSearchTermIsSaved() {
        // Given
        let term = "SomeAlbum"

        // When
        presenter.searchButtonClicked(with: term)

        // Then
        XCTAssertTrue(mockStorageManager.searchHistory.contains(term))
    }

    func test_GivenSavedAlbums_WhenSearchFromHistory_ThenAlbumsAreDisplayedFromStorage() {
        // Given
        let term = "SomeAlbum"
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

        mockStorageManager.saveAlbums(albums, for: term)

        // When
        presenter.searchFromHistory(with: term)

        // Then
        XCTAssertEqual(mockView.updateAlbumsCallCount, 1)
        XCTAssertEqual(mockView.updateAlbumsArgsAlbums.first, albums)
        XCTAssertEqual(mockView.showErrorCallCount, 0)
    }

    func test_GivenSavedAlbums_WhenSearchAlbums_ThenAlbumsAreDisplayedFromStorage() {
        // Given
        let term = "SavedAlbums"
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

        mockStorageManager.saveAlbums(albums, for: term)

        // When
        presenter.searchAlbums(with: term)

        // Then
        let savedAlbums = mockStorageManager.loadAlbums(for: term)
        XCTAssertEqual(savedAlbums, albums)
        XCTAssertEqual(mockView.updateAlbumsCallCount, 1)
        XCTAssertEqual(mockView.updateAlbumsArgsAlbums.first, albums)
        XCTAssertEqual(mockView.showErrorCallCount, 0)
    }

    func test_GivenNewAlbums_WhenSearchAlbums_ThenAlbumsAreFetchedAndDisplayed() {
        // Given
        let term = "Eminem"
        let albums = [
            Album(artistId: 111051,
                  artistName: "Eminem",
                  collectionName: "The Eminem Show",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 10.99
                 )
        ]

        mockITunesService.stubbedAlbumsResult = .success(albums)

        // When
        presenter.searchAlbums(with: term)

        // Then
        XCTAssertEqual(mockITunesService.loadAlbumsCallCount, 1)
        XCTAssertEqual(mockITunesService.loadAlbumsArgsTerms.first, term)
        XCTAssertEqual(mockView.updateAlbumsCallCount, 1)
        XCTAssertEqual(mockView.updateAlbumsArgsAlbums.first, albums)
    }
}
