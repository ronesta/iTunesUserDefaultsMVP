//
//  SearchHistoryPresenter.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 11.01.2025.
//

import Foundation

final class SearchHistoryPresenter: SearchHistoryViewOutputProtocol {
    weak var view: SearchHistoryViewInputProtocol?

    private let storageManager: StorageManagerProtocol

    init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
    }

    func viewDidLoad() {
        loadSearchHistory()
    }

    private func loadSearchHistory() {
        let history = storageManager.getSearchHistory()
        view?.updateSearchHistory(history)
    }
}
