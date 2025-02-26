//
//  SearchHistoryViewProtocol.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 22.01.2025.
//

import Foundation

protocol SearchHistoryViewProtocol: AnyObject {
    func updateSearchHistory(_ history: [String])
}
