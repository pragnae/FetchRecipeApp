//
//  ImageCache.swift
//  FetchRecipeApp
//
//  Created by Pragna Elavarthi on 3/13/25.
//

// Simple in-memory image caching to reduce redundant network requests.

import UIKit

class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()

    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }

    func saveImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
