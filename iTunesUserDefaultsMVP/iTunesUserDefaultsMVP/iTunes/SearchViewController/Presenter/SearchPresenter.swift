//
//  SearchViewPresenter.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 11.01.2025.
//

import Foundation
import UIKit

final class SearchPresenter: SearchViewOutputProtocol {
    weak var view: SearchViewInputProtocol?

    private let iTunesService: ITunesServiceProtocol
    private let storageManager: StorageManagerProtocol

    private var albums = [Album]()

    init(iTunesService: ITunesServiceProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.iTunesService = iTunesService
        self.storageManager = storageManager
    }

    private func saveSearchTerm(_ term: String) {
        storageManager.saveSearchTerm(term)
    }

    func didTypeSearch(_ searchQuery: String) {
        guard !searchQuery.isEmpty else {
            return
        }

        searchAlbums(with: searchQuery, showErrorOnFailure: false)
    }

    func searchButtonClicked(with term: String?) {
        guard let term, !term.isEmpty else {
            return
        }

        saveSearchTerm(term)
        searchAlbums(with: term)
    }

    func searchFromHistory(with term: String) {
        searchAlbums(with: term)
    }

    func searchAlbums(with term: String, showErrorOnFailure: Bool = true) {
        if let savedAlbums = storageManager.loadAlbums(for: term) {
            albums = savedAlbums
            view?.updateAlbums(albums)
            return
        }

        iTunesService.loadAlbums(albumName: term) { [weak self] result in
            guard let self else {
                return
            }

            switch result {
            case .success(let albums):
                self.albums = albums.sorted { $0.collectionName < $1.collectionName }
                self.view?.updateAlbums(self.albums)
                self.storageManager.saveAlbums(albums, for: term)
                print("Successfully loaded \(albums.count) albums.")
            case .failure(let error):
                if showErrorOnFailure {
                    self.view?.showError(error.localizedDescription)
                }
            }
        }
    }
}
