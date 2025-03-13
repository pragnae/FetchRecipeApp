//
//  CachedAsyncImage.swift
//  FetchRecipeApp
//
//  Created by Pragna Elavarthi on 3/13/25.
//


// Asynchronously loads and caches images to improve performance and reduce network requests.


import SwiftUI

struct CachedAsyncImage: View {
    let url: URL?

    @State private var image: UIImage?

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView().onAppear { loadImage() }
            }
        }
    }

    private func loadImage() {
        guard let url = url else { return }
        
        if let cachedImage = ImageCache.shared.getImage(forKey: url.absoluteString) {
            image = cachedImage
        } else {
            Task {
                if let data = try? Data(contentsOf: url),
                   let uiImage = UIImage(data: data) {
                    ImageCache.shared.saveImage(uiImage, forKey: url.absoluteString)
                    image = uiImage
                }
            }
        }
    }
}

