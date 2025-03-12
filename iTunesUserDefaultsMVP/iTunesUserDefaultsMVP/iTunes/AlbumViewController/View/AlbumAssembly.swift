//
//  AlbumAssembly.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 22.01.2025.
//

import Foundation
import UIKit

struct AlbumAssembly {
    func build(with album: Album) -> UIViewController {
        let storageManager = StorageManager()
        let imageLoader = ImageLoader(storageManager: storageManager)

        let presenter = AlbumPresenter(imageLoader: imageLoader,
                                       album: album
        )

        let albumViewController = AlbumViewController(presenter: presenter)

        presenter.view = albumViewController

        return albumViewController
    }
}
