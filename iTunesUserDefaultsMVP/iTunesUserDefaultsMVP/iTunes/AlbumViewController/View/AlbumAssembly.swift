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
        let networkManager = NetworkManager(storageManager: storageManager)

        let albumViewController = AlbumViewController()

        let presenter = AlbumPresenter(view: albumViewController,
                                       networkManager: networkManager,
                                       storageManager: storageManager,
                                       album: album
        )

        albumViewController.presenter = presenter

        return albumViewController
    }
}
