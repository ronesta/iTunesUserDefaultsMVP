//
//  SearchViewControllerSnapshotTests.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 13.04.2025.
//

import XCTest
import SnapshotTesting
@testable import iTunesUserDefaultsMVP

final class SearchViewControllerSnapshotTests: XCTestCase {
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
    
    func testSearchViewControllerInitialAppearance() {
        let navigationController = UINavigationController(rootViewController: viewController)

        assertSnapshot(of: navigationController, as: .image)
    }

    func testSearchViewControllerWithAlbums() {
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
    
        let navigationController = UINavigationController(rootViewController: viewController)

        viewController.loadViewIfNeeded()
        viewController.updateAlbums(albums)

        assertSnapshot(of: navigationController, as: .image)
    }
}
