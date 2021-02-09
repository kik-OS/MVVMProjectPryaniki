//
//  FirstViewModel.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 09.02.2021.
//

import Foundation

protocol FirstViewModelProtocol: class {
    
    var dataModel: DataModel? {get}
    func fetchDataModel(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    var correctInformation: [Datum] {get set}
    func fetchCorrectInformation()
    func cellWithTextViewModel(indexPath: IndexPath) -> CellWithTextViewModelProtocol?
    func cellWithImageViewModel(indexPath: IndexPath) -> CellWIthImageViewModelProtocol?
    func cellWithSelectorViewModel(indexPath: IndexPath) -> CellWithSelectorViewModelProtocol?
}

class FirstViewModel: FirstViewModelProtocol {
    
    
    
    
    func cellWithImageViewModel(indexPath: IndexPath) -> CellWIthImageViewModelProtocol? {
        let block = correctInformation[indexPath.row]
        return CellWithImageViewModel(block: block)
    }
    
    func cellWithSelectorViewModel(indexPath: IndexPath) -> CellWithSelectorViewModelProtocol? {
        let block = correctInformation[indexPath.row]
        return CellWithSelectorViewModel(block: block)
    }
    
    func cellWithTextViewModel(indexPath: IndexPath) -> CellWithTextViewModelProtocol? {
        let block = correctInformation[indexPath.row]
        return CellWithTextViewModel(block: block)
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
    
    
    var dataModel: DataModel?
    
    func fetchDataModel(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData() { dataModel in
            self.dataModel = dataModel
            self.fetchCorrectInformation()
            completion()
        }
            
    }
    
    func numberOfRows() -> Int {
        correctInformation.count
    }
    
}
