//
//  MockPresenter.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 14.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsMVP

final class MockAlbumPresenter: AlbumPresenterProtocol {
    private(set) var viewDidLoadCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }
}
