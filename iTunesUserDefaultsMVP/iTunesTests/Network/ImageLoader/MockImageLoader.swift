//
//  MockImageLoader.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 04.05.2025.
//

import UIKit.UIImage
@testable import iTunesUserDefaultsMVP

final class MockImageLoader: ImageLoaderProtocol {
    var mockImage: UIImage?
    var shouldReturnError: Bool = false

    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        if shouldReturnError {
            completion(nil)
        } else {
            completion(mockImage)
        }
    }
}
