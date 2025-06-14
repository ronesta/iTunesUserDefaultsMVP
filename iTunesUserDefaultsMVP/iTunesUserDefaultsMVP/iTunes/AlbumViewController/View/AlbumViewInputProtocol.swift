//
//  AlbumViewProtocol.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 22.01.2025.
//

import Foundation
import UIKit.UIImage

protocol AlbumViewInputProtocol: AnyObject {
    func displayAlbumDetails(album: Album, image: UIImage)
}
