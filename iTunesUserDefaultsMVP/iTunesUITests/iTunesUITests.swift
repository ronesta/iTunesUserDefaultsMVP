//
//  iTunesUITests.swift
//  iTunesUITests
//
//  Created by Ибрагим Габибли on 12.04.2025.
//

import XCTest

final class iTunesUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testSearchBarExistsAndIsFunctional() {
        let searchBar = app.searchFields["Search Albums"]

        XCTAssertTrue(searchBar.exists)

        searchBar.tap()
        searchBar.typeText("Test Album")

        XCTAssertFalse(app.keyboards.element.exists)
    }

    func testCollectionViewExists() throws {
        let collectionView = app.collectionViews.firstMatch

        XCTAssertTrue(collectionView.exists)
    }

    func testCollectionViewDisplaysResults() {
        performSearch(with: "Album")

        let collectionView = app.collectionViews.element

        waitForCellsToAppear(in: collectionView)

        XCTAssertTrue(collectionView.cells.count > 0)
    }

    func testTappingOnCollectionViewCellTriggersOnSelect() {
        performSearch(with: "Sample Album")

        let firstCell = app.collectionViews.cells.element(boundBy: 0)

        XCTAssertTrue(firstCell.waitForExistence(timeout: 5))

        let albumImageView = firstCell.images["albumImageView"]
        let albumNameLabel = firstCell.staticTexts["albumNameLabel"]
        let artistNameLabel = firstCell.staticTexts["artistNameLabel"]

        XCTAssertTrue(albumImageView.exists)
        XCTAssertTrue(albumNameLabel.exists)
        XCTAssertTrue(artistNameLabel.exists)

        firstCell.tap()
    }

    private func performSearch(with text: String) {
        let searchBar = app.searchFields["Search Albums"]
        searchBar.tap()
        searchBar.typeText("\(text)")
    }

    private func waitForCellsToAppear(in collectionView: XCUIElement) {
        let cellsPredicate = NSPredicate(format: "cells.count > 0")
        expectation(for: cellsPredicate, evaluatedWith: collectionView, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }

    override func tearDownWithError() throws {
        app = nil
    }
}
