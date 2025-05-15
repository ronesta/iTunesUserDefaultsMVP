//
//  MockITunesServiceForPresenter.swift
//  iTunesTests
//
//  Created by Ибрагим Габибли on 13.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsMVP

final class MockITunesService: ITunesServiceProtocol {
    private(set) var loadAlbumsCallCount = 0
    private(set) var loadLabumsCompletions = [(Result<[Album], Error>) -> Void]()
    private(set) var albumName: String?

    var stubbedAlbumsResult: Result<[Album], Error>?

    func loadAlbums(albumName: String, completion: @escaping (Result<[Album], Error>) -> Void) {
        loadAlbumsCallCount += 1
        loadLabumsCompletions.append(completion)
        self.albumName = albumName

        if let result = stubbedAlbumsResult {
            completion(result)
        }
    }
}
