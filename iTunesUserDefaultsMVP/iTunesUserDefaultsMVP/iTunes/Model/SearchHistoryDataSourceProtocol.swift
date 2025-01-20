//
//  SearchHistoryDataSourceProtocol.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 16.01.2025.
//

import Foundation
import UIKit

protocol SearchHistoryDataSourceProtocol: AnyObject, UITableViewDataSource {
    var searchHistory: [String] { get set }
}
