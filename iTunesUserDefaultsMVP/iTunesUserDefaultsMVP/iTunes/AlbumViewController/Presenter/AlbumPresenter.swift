//
//  AlbumPresenter.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 16.01.2025.
//

import Foundation
import UIKit.UIImage

final class AlbumPresenter: AlbumPresenterProtocol {
    weak var view: AlbumViewProtocol?

    private let imageLoader: ImageLoaderProtocol
    private let album: Album

    init(imageLoader: ImageLoaderProtocol,
         album: Album
    ) {
        self.imageLoader = imageLoader
        self.album = album
    }

    func viewDidLoad() {
        loadAlbumDetails()
    }

    private func loadAlbumDetails() {
        imageLoader.loadImage(from: album.artworkUrl100) { [weak self] loadedImage in

            guard let self,
                  let loadedImage else {
                return
            }

            view?.displayAlbumDetails(album: album, image: loadedImage)
        }
    }
}
