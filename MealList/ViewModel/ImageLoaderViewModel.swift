//
//  ImageLoaderViewModel.swift
//  MealList
//
//  Created by Jyothi Suhani Peddi on 12/17/23.
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {
    @Published var state: State = .empty

    enum State {
        case empty
        case loading
        case success(UIImage)
        case failure
    }

    private var url: URL

    init(url: URL) {
        self.url = url
        loadImage()
    }

    func loadImage() {
        state = .loading

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.state = .success(image)
                }
            } else {
                DispatchQueue.main.async {
                    self.state = .failure
                }
            }
        }.resume()
    }
}
