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
    init(block: Datum, indexPath: IndexPath)
    func calculateIndexFromId() -> Int
    var delegate: FirstViewModelDelegate? { get set }
    var currentIndexPath: IndexPath {get}
    
}

class CellWithSelectorViewModel: CellWithSelectorViewModelProtocol {
   
    
    var currentIndexPath: IndexPath
    
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
    
    required init(block: Datum, indexPath: IndexPath) {
        self.block = block
        self.currentIndexPath = indexPath
    }
}
