//
//  AlbumViewControllerSnapshotTests.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 14.04.2025.
//

import XCTest
import SnapshotTesting
@testable import iTunesUserDefaultsMVP

final class AlbumViewControllerSnapshotTests: XCTestCase {
    func testAppearanceWithData() {
        let mockPresenter = MockAlbumPresenter()
        let viewController = AlbumViewController(presenter: mockPresenter)

        let image = UIImage(systemName: "checkmark.diamond")
        let album = Album(artistId: 111051,
                          artistName: "Eminem",
                          collectionName: "The Eminem Show",
                          artworkUrl100: "url_to_image",
                          collectionPrice: 10.99
                         )

        viewController.displayAlbumDetails(album: album, image: image!)

        assertSnapshot(of: viewController, as: .image)
    }
}
