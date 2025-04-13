//
//  MockITunesService.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 13.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsMVP

final class MockITunesService: ITunesServiceProtocol {
    private(set) var albumName: String?
    private(set) var result: Result<[Album], Error>?
    
    func loadAlbums(albumName: String, completion: @escaping (Result<[Album], Error>) -> Void) {
        self.albumName = albumName
        if let result = result {
            completion(result)
        }
    }
}
