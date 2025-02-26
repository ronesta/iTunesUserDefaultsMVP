//
//  SearchDataSourceProtocol.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 16.01.2025.
//

import Foundation
import UIKit

protocol SearchDataSourceProtocol: AnyObject, UICollectionViewDataSource {
    var albums: [Album] { get set }
}
