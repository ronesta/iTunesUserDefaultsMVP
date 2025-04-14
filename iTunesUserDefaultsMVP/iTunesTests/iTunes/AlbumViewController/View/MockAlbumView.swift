//
//  MockAlbumView.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 14.04.2025.
//

import UIKit.UIImage
@testable import iTunesUserDefaultsMVP

final class MockAlbumView: AlbumViewProtocol {
    private(set) var displayedAlbum: Album?
    private(set) var displayedImage: UIImage?

    func displayAlbumDetails(album: Album, image: UIImage) {
        displayedAlbum = album
        displayedImage = image
    }
}
