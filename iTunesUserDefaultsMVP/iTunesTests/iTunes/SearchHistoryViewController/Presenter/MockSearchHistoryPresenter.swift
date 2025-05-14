//
//  MockSearchHistoryPresenter.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 14.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsMVP

final class MockSearchHistoryPresenter: SearchHistoryViewOutputProtocol {
    private(set) var viewDidLoadCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }
}
