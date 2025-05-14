//
//  SearchViewProtocol.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 22.01.2025.
//

import Foundation

protocol SearchViewInputProtocol: AnyObject {
    func updateAlbums(_ albums: [Album])

    func showError(_ message: String)
}
