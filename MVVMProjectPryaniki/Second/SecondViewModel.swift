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
    var blockText: String? { get }
    var blockId: String? { get }
    var imageData: Data? { get }
    var selectedIndexFromSelector: Int? { get set }
    func confugure()
    
    
}


class SecondViewModel: SecondViewModelProtocol {
    var selectedIndexFromSelector: Int?
    
    var imageData: Data?
    
    var blockText: String?
    
    var blockId: String?
    
    
    func confugure() {
        
        switch block.name {
        case "hz":
            blockText = block.data?.text
        case "picture":
            blockText = block.data?.text
            imageData = ImageManager.shared.fetchImage(from: block.data?.url)
        case "selector":
            guard let variants = block.data?.variants else {return}
            
            if let selectedIndex = selectedIndexFromSelector {
                blockText = "Выбран: \(variants[selectedIndex].text ?? "")"
                blockId = "ID: \(variants[selectedIndex].id ?? 0)"
            } else {
                guard let index = block.data?.selectedId else {return}
                blockText = "Выбран: \(variants[index - 1].text ?? "")"
                blockId = "ID: \(variants[index - 1].id ?? 0)"
            }
        default:
            break
        }
    }
    
    


    
    private let block: Datum
    
    required init(block: Datum) {
        self.block = block
    }
    
    var blockName: String {
        block.name ?? ""
    }
    
    
}
