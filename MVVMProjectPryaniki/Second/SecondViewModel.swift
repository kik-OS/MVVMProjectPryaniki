//
//  SecondViewModel.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 09.02.2021.
//

import Foundation

protocol SecondViewModelProtocol: class {
    //Инициализируем свойство без которого не будет рабоать
    init(block: Datum)
    
    var blockName: String { get }
//    var blockText: String? { get }
//    var blockId: String? { get }
//    var blockImage: String? { get }
    
    
}


class SecondViewModel: SecondViewModelProtocol {
//    var blockText: String? {
//        block.data?.text
//    }
//
//    var blockId: String? {
//        block.data?.variants
//    }
//
//    var blockImage: String?
//
//    var blockText: String
    
    private let block: Datum
    
    required init(block: Datum) {
        self.block = block
    }
    
    var blockName: String {
        block.name ?? ""
    }
    
    
}
