//
//  AlbumPresenterTests.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 14.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsMVP

final class AlbumPresenterTests: XCTestCase {
    private var presenter: AlbumPresenter!
    private var mockImageLoader: MockImageLoader!
    private var mockView: MockAlbumView!
    private var mockAlbum: Album!

    override func setUp() {
        super.setUp()
        mockImageLoader = MockImageLoader()
        mockView = MockAlbumView()
        mockAlbum = Album(artistId: 111051,
                          artistName: "Eminem",
                          collectionName: "The Eminem Show",
                          artworkUrl100: "url_to_image",
                          collectionPrice: 10.99
                         )
        presenter = AlbumPresenter(imageLoader: mockImageLoader,
                                   album: mockAlbum
        )
        presenter.view = mockView
    }

    override func tearDown() {
        presenter = nil
        mockImageLoader = nil
        mockView = nil
        super.tearDown()
    }

    func test_GivenAlbumAndImage_WhenViewDidLoad_ThenAlbumDetailsAreDisplayed() {
        // Given
        let expectedImage = UIImage(systemName: "checkmark.diamond")
        mockImageLoader.mockImage = expectedImage

        // When
        presenter.viewDidLoad()

        // Then
        XCTAssertEqual(mockView.displayAlbumDetailsCallCount, 1)
        XCTAssertEqual(mockView.displayAlbumDetailsArgsHistory.first?.album, mockAlbum)
        XCTAssertEqual(mockView.displayAlbumDetailsArgsHistory.first?.image, expectedImage)
    }
}
