//
//  SceneDelegate.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 09.01.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        // MARK: - Managers
        let storageManager = StorageManager()
        let networkManager = NetworkManager(storageManager: storageManager)

        // MARK: - searchViewController
        let searchViewController = SearchViewController()
        let searchPresenter = SearchPresenter(view: searchViewController,
                                              networkManager: networkManager,
                                              storageManager: storageManager
        )

        let searchCollectionViewDataSource = SearchCollectionViewDataSource()

        searchViewController.presenter = searchPresenter
        searchViewController.storageManager = storageManager
        searchViewController.collectionViewDataSource = searchCollectionViewDataSource
        
        searchCollectionViewDataSource.presenter = searchPresenter

        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        let searchTabBarItem = UITabBarItem(title: "Search",
                                            image: UIImage(systemName: "magnifyingglass"),
                                            tag: 0)
        searchTabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        searchNavigationController.tabBarItem = searchTabBarItem

        // MARK: - searchHistoryViewController
        let searchHistoryViewController = SearchHistoryViewController()
        let searchHistoryPresenter = SearchHistoryPresenter(
            view: searchHistoryViewController,
            storageManager: storageManager
        )

        let searchHistoryTableViewDataSource = SearchHistoryTableViewDataSource()

        searchHistoryViewController.presenter = searchHistoryPresenter
        searchHistoryViewController.storageManager = storageManager
        searchHistoryViewController.tableViewDataSource = searchHistoryTableViewDataSource

        let searchHistoryNavigationController = UINavigationController(rootViewController: searchHistoryViewController)
        let searchHistoryTabBarItem = UITabBarItem(title: "History",
                                             image: UIImage(systemName: "clock"),
                                             tag: 1)
        searchHistoryTabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        searchHistoryNavigationController.tabBarItem = searchHistoryTabBarItem

        // MARK: - albumViewController
//        let albumViewController = AlbumViewController()
//        let albumPresenter = AlbumPresenter(view: albumViewController,
//                                            networkManager: networkManager,
//                                            storageManager: storageManager
//        )
//        albumViewController.presenter = albumPresenter
//        searchViewController.albumPresenter = albumPresenter

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [searchNavigationController,
                                            searchHistoryNavigationController]

        tabBarController.tabBar.barTintColor = .white

        // MARK: - UIWindow
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }
}
