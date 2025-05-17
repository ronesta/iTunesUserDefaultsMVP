//
//  AlbumViewControllerTests.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 14.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsMVP

final class AlbumViewControllerTests: XCTestCase {
    private var viewController: AlbumViewController!
    private var mockPresenter: MockAlbumPresenter!
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockAlbumPresenter()
        viewController = AlbumViewController(presenter: mockPresenter)
    }

    override func tearDown() {
        viewController = nil
        mockPresenter = nil
        super.tearDown()
    }

    func test_GivenPresenter_WhenViewDidLoad_ThenPresenterViewDidLoadIsCalled() {
        // Given presenter

        // When
        viewController.viewDidLoad()

        // Then
        XCTAssertTrue(mockPresenter.viewDidLoadCalled)
    }

    func test_GivenAlbumAndImage_WhenDisplayAlbumDetailsCalled_ThenViewIsUpdatedWithAlbumDetails() {
        // Given
        let image = UIImage(systemName: "checkmark.diamond")
        let album = Album(artistId: 111051,
                          artistName: "Eminem",
                          collectionName: "The Eminem Show",
                          artworkUrl100: "url_to_image",
                          collectionPrice: 10.99
                         )

        // When
        viewController.displayAlbumDetails(album: album, image: image!)

        // Then
        XCTAssertEqual(viewController.albumNameLabel.text, "The Eminem Show")
        XCTAssertEqual(viewController.artistNameLabel.text, "Eminem")
        XCTAssertEqual(viewController.collectionPriceLabel.text, "10.99 $")
        XCTAssertEqual(viewController.albumImageView.image, image)
    }
}
