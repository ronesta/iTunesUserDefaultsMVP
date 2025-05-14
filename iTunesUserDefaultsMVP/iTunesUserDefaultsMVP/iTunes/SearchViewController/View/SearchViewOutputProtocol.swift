//
//  SearchPresenterProtocol.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 22.01.2025.
//

import Foundation
import UIKit

protocol SearchViewOutputProtocol: AnyObject {
    func didTypeSearch(_ searchQuery: String)

    func searchButtonClicked(with term: String?)

    func searchFromHistory(with term: String)
}
