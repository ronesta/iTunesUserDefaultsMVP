//
//  MockSearchView.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 13.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsMVP

final class MockSearchView: SearchViewInputProtocol {
    private(set) var albums: [Album]?
    private(set) var errorMessage: String?

    func updateAlbums(_ albums: [Album]) {
        self.albums = albums
    }
    
    func showError(_ message: String) {
        errorMessage = message
    }
}
