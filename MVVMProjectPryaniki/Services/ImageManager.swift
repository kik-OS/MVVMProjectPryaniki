//
//  ImageManager.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 05.02.2021.
//

import Foundation

class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}
