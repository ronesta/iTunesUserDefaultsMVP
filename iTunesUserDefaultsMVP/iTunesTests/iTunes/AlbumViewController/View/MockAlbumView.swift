//
//  MockAlbumView.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 14.04.2025.
//

import UIKit.UIImage
@testable import iTunesUserDefaultsMVP

final class MockAlbumView: AlbumViewInputProtocol {
    private(set) var displayAlbumDetailsCallCount = 0
    private(set) var displayAlbumDetailsArgsHistory = [(album: Album, image: UIImage)]()

    func displayAlbumDetails(album: Album, image: UIImage) {
        displayAlbumDetailsCallCount += 1
        displayAlbumDetailsArgsHistory.append((album: album, image: image))
    }
}
