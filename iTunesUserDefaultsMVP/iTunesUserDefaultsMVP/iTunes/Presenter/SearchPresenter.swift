//
//  SearchViewPresenter.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 11.01.2025.
//

import Foundation
import UIKit

protocol SearchPresenterProtocol: AnyObject {
    func searchAlbums(with term: String)

    func loadImage(for album: Album, completion: @escaping (UIImage?) -> Void)
}

final class SearchPresenter: SearchPresenterProtocol {
    weak var view: SearchViewProtocol?
    private let networkManager: NetworkManagerProtocol
    private let storageManager: StorageManagerProtocol

    private var albums = [Album]()

    init(view: SearchViewProtocol? = nil,
         networkManager: NetworkManagerProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.view = view
        self.networkManager = networkManager
        self.storageManager = storageManager
    }

    func searchAlbums(with term: String) {
        if let savedAlbums = storageManager.loadAlbums(for: term) {
            albums = savedAlbums
            view?.updateAlbums(albums)
            return
        }

        networkManager.loadAlbums(albumName: term) { [weak self] result in
            guard let self else {
                return
            }

            switch result {
            case .success(let albums):
                DispatchQueue.main.async {
                    self.albums = albums.sorted { $0.collectionName < $1.collectionName }
                    self.view?.updateAlbums(self.albums)
                    self.storageManager.saveSearchTerm(term)
                    self.storageManager.saveAlbums(albums, for: term)
                    print("Successfully loaded \(albums.count) albums.")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.view?.showError(error.localizedDescription)
                }
            }
        }
    }

    func loadImage(for album: Album, completion: @escaping (UIImage?) -> Void) {
        networkManager.loadImage(from: album.artworkUrl100, completion: completion)
    }
}
