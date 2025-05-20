//
//  MockSearchView.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 13.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsMVP

final class MockSearchView: SearchViewInputProtocol {
    private(set) var updateAlbumsCallCount = 0
    private(set) var updateAlbumsArgsAlbums = [[Album]]()

    private(set) var showErrorCallCount = 0
    private(set) var showErrorArgsMessages = [String]()

    func updateAlbums(_ albums: [Album]) {
        updateAlbumsCallCount += 1
        updateAlbumsArgsAlbums.append(albums)
    }
    
    func showError(_ message: String) {
        showErrorCallCount += 1
        showErrorArgsMessages.append(message)
    }
}
