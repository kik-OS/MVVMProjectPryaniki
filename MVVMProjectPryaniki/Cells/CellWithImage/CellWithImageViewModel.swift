//
//  CellWithImageViewModel.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 09.02.2021.
//

import Foundation

protocol CellWIthImageViewModelProtocol {
    var blockName: String { get }
    var blockText: String { get }
    var imageData: Data? { get }
    init(block: Datum)
}

class CellWithImageViewModel: CellWIthImageViewModelProtocol {
    var blockName: String {
        block.name ?? ""
    }
    
    var blockText: String {
        block.data?.text ?? ""
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImage(from: block.data?.url)
    }
    
    
    private let block: Datum
    
    required init(block: Datum) {
        self.block = block
    }
    
    
    
    
    
}
