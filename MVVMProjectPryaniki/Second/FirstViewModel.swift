//
//  FirstViewModel.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 09.02.2021.


import Foundation

protocol FirstViewModelDelegate {
    func updateValueFromSelector(newValue: Int, indexPath: IndexPath)
}

protocol FirstViewModelProtocol: class {
    var dataModel: DataModel? {get}
    var correctInformation: [Datum] {get set}
    func fetchDataModel(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func fetchCorrectInformation()
    func changeBlock(indexPath: IndexPath) -> Datum
    func cellWithTextViewModel(indexPath: IndexPath) -> CellWithTextViewModelProtocol?
    func cellWithImageViewModel(indexPath: IndexPath) -> CellWIthImageViewModelProtocol?
    func cellWithSelectorViewModel(indexPath: IndexPath) -> CellWithSelectorViewModelProtocol?
    func viewModelForSelectedRow(indexPath: IndexPath) -> SecondViewModelProtocol?
    func updateSelectedIndex(indexPath: IndexPath, newValue: Int?)
}

class FirstViewModel: FirstViewModelProtocol, FirstViewModelDelegate {
    var dataModel: DataModel?
    var correctInformation: [Datum] = []
    
    func fetchDataModel(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData() { dataModel in
            self.dataModel = dataModel
            self.fetchCorrectInformation()
            completion()
        }
    }
    
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
    
    func updateValueFromSelector(newValue: Int, indexPath: IndexPath) {
        updateSelectedIndex(indexPath: indexPath, newValue: newValue + 1)
    }
    
    func updateSelectedIndex(indexPath: IndexPath, newValue: Int?)  {
        correctInformation[indexPath.row].data?.selectedId = newValue
    }
    
    func changeBlock(indexPath: IndexPath) -> Datum {
        correctInformation[indexPath.row]
    }
    
    func viewModelForSelectedRow(indexPath: IndexPath) -> SecondViewModelProtocol? {
        return SecondViewModel(block: changeBlock(indexPath: indexPath))
    }
    
    func cellWithImageViewModel(indexPath: IndexPath) -> CellWIthImageViewModelProtocol? {
        CellWithImageViewModel(block: changeBlock(indexPath: indexPath))
    }
    
    func cellWithSelectorViewModel(indexPath: IndexPath) -> CellWithSelectorViewModelProtocol? {
        CellWithSelectorViewModel(block: changeBlock(indexPath: indexPath), indexPath: indexPath)
    }
    
    func cellWithTextViewModel(indexPath: IndexPath) -> CellWithTextViewModelProtocol? {
        CellWithTextViewModel(block: changeBlock(indexPath: indexPath))
    }
    
    func numberOfRows() -> Int {
        correctInformation.count
    }
}
