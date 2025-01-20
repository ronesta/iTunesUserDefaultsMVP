//
//  SearchHistoryPresenter.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 11.01.2025.
//

import Foundation

protocol SearchHistoryPresenterProtocol: AnyObject {
    init(view: SearchHistoryViewProtocol, storageManager: StorageManagerProtocol)

    func loadSearchHistory()
}

final class SearchHistoryPresenter: SearchHistoryPresenterProtocol {
    weak var view: SearchHistoryViewProtocol?
    private let storageManager: StorageManagerProtocol

    init(view: SearchHistoryViewProtocol, storageManager: StorageManagerProtocol) {
        self.view = view
        self.storageManager = storageManager
    }

    func loadSearchHistory() {
        let history = storageManager.getSearchHistory()
        view?.updateSearchHistory(history)
    }
}
