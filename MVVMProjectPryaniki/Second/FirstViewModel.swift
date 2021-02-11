//
//  FirstViewModel.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 09.02.2021.
//

import Foundation

protocol FirstViewModelDelegate {
    func updateValueFromSelector(newValue: Int)
}


protocol FirstViewModelProtocol: class {
    
    var dataModel: DataModel? {get}
    func fetchDataModel(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    var correctInformation: [Datum] {get set}
    func fetchCorrectInformation()
    func changeBlock(indexPath: IndexPath) -> Datum
    func cellWithTextViewModel(indexPath: IndexPath) -> CellWithTextViewModelProtocol?
    func cellWithImageViewModel(indexPath: IndexPath) -> CellWIthImageViewModelProtocol?
    func cellWithSelectorViewModel(indexPath: IndexPath) -> CellWithSelectorViewModelProtocol?
    func viewModelForSelectedRow(indexPath: IndexPath) -> SecondViewModelProtocol?
    var newIndexFromSelector: Int? {get set}

}

class FirstViewModel: FirstViewModelProtocol {
    var newIndexFromSelector: Int?
    
    
    
        
    var dataModel: DataModel?
    
    func fetchDataModel(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData() { dataModel in
            self.dataModel = dataModel
            self.fetchCorrectInformation()
            completion()
        }
    }
    
    var correctInformation: [Datum] = []
    
    func fetchCorrectInformation() {
        guard let data = dataModel?.data else {return}
        guard let view = dataModel?.view else {return}
        
        for poziciya in view {
            for i in data {
                if poziciya == i.name {
                    correctInformation.append(i)
                }
            }
        }
    }
    
    func changeBlock(indexPath: IndexPath) -> Datum {
        correctInformation[indexPath.row]
    }

    func viewModelForSelectedRow(indexPath: IndexPath) -> SecondViewModelProtocol? {
        var block = changeBlock(indexPath: indexPath)
        if  newIndexFromSelector != nil {
            block.data?.selectedId = newIndexFromSelector
        }
       return SecondViewModel(block: block)
    }
    
    func cellWithImageViewModel(indexPath: IndexPath) -> CellWIthImageViewModelProtocol? {
        CellWithImageViewModel(block: changeBlock(indexPath: indexPath))
    }
    
    func cellWithSelectorViewModel(indexPath: IndexPath) -> CellWithSelectorViewModelProtocol? {
        CellWithSelectorViewModel(block: changeBlock(indexPath: indexPath))
    }
    
    func cellWithTextViewModel(indexPath: IndexPath) -> CellWithTextViewModelProtocol? {
        CellWithTextViewModel(block: changeBlock(indexPath: indexPath))
    }
    
    func numberOfRows() -> Int {
        correctInformation.count
    }
}
