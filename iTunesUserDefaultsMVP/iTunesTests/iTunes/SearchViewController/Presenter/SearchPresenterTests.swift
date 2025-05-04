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

    func testDidTypeSearchQueryCallsService() {
        let term = "SomeAlbum"
        presenter.didTypeSearch(term)

        XCTAssertEqual(mockITunesService.albumName, term)
    }

    func testSearchButtonClickedSavesSearchTerm() {
        let term = "SomeAlbum"
        presenter.searchButtonClicked(with: term)

        XCTAssertTrue(mockStorageManager.searchHistory.contains(term))
    }

    func testSearchFromHistoryLoadsAlbums() {
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
        presenter.searchFromHistory(with: term)

        XCTAssertEqual(mockView.albums, albums)
        XCTAssertNil(mockView.errorMessage)
    }

    func testSearchAlbumsWithSavedAlbums() {
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
        presenter.searchAlbums(with: term)

        let savedAlbums = mockStorageManager.loadAlbums(for: term)
        XCTAssertEqual(savedAlbums, albums)

        XCTAssertEqual(mockView.albums, albums)
        XCTAssertNil(mockView.errorMessage)
    }

    func testSearchAlbumsWithNewAlbums() {
        let term = "Eminem"

        let albums = [
            Album(artistId: 111051,
                  artistName: "Eminem",
                  collectionName: "The Eminem Show",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 10.99
                 )
        ]

        mockITunesService.albums = albums

        presenter.searchAlbums(with: term)

        XCTAssertEqual(mockView.albums, albums)
        XCTAssertNil(mockView.errorMessage)

        let savedAlbums = mockStorageManager.loadAlbums(for: term)
        XCTAssertEqual(savedAlbums, albums)
    }
}
