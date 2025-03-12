//
//  UpdateInfoAssembly.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 22.01.2025.
//

import Foundation
import UIKit

struct SearchAssembly {
    func build() -> UIViewController {
        let storageManager = StorageManager()
        let iTunesService = ITunesService()
        let imageLoader = ImageLoader(storageManager: storageManager)

        let presenter = SearchPresenter(iTunesService: iTunesService,
                                        storageManager: storageManager
        )

        let collectionViewDataSource = SearchCollectionViewDataSource(imageLoader: imageLoader)

        let viewController = SearchViewController(presenter: presenter,
                                                  collectionViewDataSource: collectionViewDataSource
        )

        presenter.view = viewController

        let navigationController = UINavigationController(rootViewController: viewController)
        let coordinator = SearchCoordinator(viewController: viewController)

        configureOnSelect(for: viewController, with: collectionViewDataSource, coordinator: coordinator)

        let tabBarItem = UITabBarItem(title: "Search",
                                      image: UIImage(systemName: "magnifyingglass"),
                                      tag: 0)
        tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        navigationController.tabBarItem = tabBarItem

        return navigationController
    }

    private func configureOnSelect(for viewController: SearchViewController,
                                   with collectionViewDataSource: SearchCollectionViewDataSource,
                                   coordinator: SearchCoordinatorProtocol
    ) {
        viewController.onSelect = { indexPath in
            let album = collectionViewDataSource.albums[indexPath.item]

            coordinator.didSelect(album: album)
        }
    }
}
