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

    func testViewDidLoadDisplaysAlbumDetails() {
        let expectedImage = UIImage(systemName: "checkmark.diamond")
        mockImageLoader.mockImage = expectedImage

        presenter.viewDidLoad()
        waitForAsyncTasksToComplete()

        XCTAssertEqual(mockView.displayedAlbum, mockAlbum)
        XCTAssertEqual(mockView.displayedImage, expectedImage)
    }

    private func waitForAsyncTasksToComplete() {
        let expectation = expectation(description: "Waiting for async tasks")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
