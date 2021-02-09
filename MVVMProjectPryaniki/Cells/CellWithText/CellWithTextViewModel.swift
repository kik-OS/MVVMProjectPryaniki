//
//  CellWithTextViewModel.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 09.02.2021.
//

import Foundation

protocol CellWithTextViewModelProtocol {
    var blockName: String { get }
    var blockText: String { get }
    init(block: Datum)
}

class CellWithTextViewModel: CellWithTextViewModelProtocol {
    var blockName: String {
        block.name ?? ""
    }
    
    var blockText: String {
        block.data?.text ?? ""
    }
    
    private let block: Datum
    
    required init(block: Datum) {
        self.block = block
    }
    
     
}
