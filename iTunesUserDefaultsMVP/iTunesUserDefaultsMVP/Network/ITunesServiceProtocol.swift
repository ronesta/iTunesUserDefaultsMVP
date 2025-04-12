//
//  NetworkManagerProtocol.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 16.01.2025.
//

import Foundation

protocol ITunesServiceProtocol: AnyObject {
    func loadAlbums(albumName: String, completion: @escaping (Result<[Album], Error>) -> Void)
}
