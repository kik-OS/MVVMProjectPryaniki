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
    init(block: Datum)
    func calculateIndexFromId() -> Int
    var delegate: FirstViewModelDelegate? { get set }
    
}

class CellWithSelectorViewModel: CellWithSelectorViewModelProtocol {
    var delegate: FirstViewModelDelegate?
    
  
    
  
    
    var selectedSegment: Int? {
        block.data?.selectedId
    }
    
  
    
    
    func calculateIndexFromId() -> Int {
        (selectedSegment ?? 1) - 1
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
