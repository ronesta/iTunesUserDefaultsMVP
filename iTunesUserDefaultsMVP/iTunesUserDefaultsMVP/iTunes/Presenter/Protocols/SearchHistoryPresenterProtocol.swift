//
//  SearchHistoryPresenterProtocol.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 22.01.2025.
//

import Foundation

protocol SearchHistoryPresenterProtocol: AnyObject {
    init(view: SearchHistoryViewProtocol, storageManager: StorageManagerProtocol)

    func viewDidLoad()
}
