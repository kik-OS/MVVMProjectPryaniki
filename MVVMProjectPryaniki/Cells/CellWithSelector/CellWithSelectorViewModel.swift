//
//  CellWithSelectorViewModel.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 09.02.2021.
//

import Foundation

protocol CellWithSelectorViewModelProtocol {
    
    var blockName: String { get }
    var variants: [Variant]? { get }
    var selectedSegment: Int? { get }
    var selectedSegmentIndexForSubtitle: Int { get }
//    var indexForSelector: Int { get }
    init(block: Datum)
}

class CellWithSelectorViewModel: CellWithSelectorViewModelProtocol {
//    var indexForSelector: Int {
//        
//    }
    
    var selectedSegmentIndexForSubtitle: Int {
        (block.data?.selectedId ?? 1) - 1
    }
    
    var selectedSegment: Int? {
        block.data?.selectedId
    }
    
    var variants: [Variant]? {
        block.data?.variants 
    }
    
    
    var blockName: String {
        block.name ?? ""
    }
    
    private let block: Datum
    
    required init(block: Datum) {
        self.block = block
    }
    
    
}
