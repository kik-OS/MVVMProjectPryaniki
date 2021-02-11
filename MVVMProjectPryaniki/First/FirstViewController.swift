//
//  FirstViewController.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 05.02.2021.

/*Задание: В качестве тестового задания предлагается создать небольшое приложение, позволяющее:
 - получать с сервера json-файл cо списком данных нескольких типов (ex: картинка, блок текста, селектор одного варианта из N) и списком кого, какие блоки данных и в каком порядке надо отобразить.
 - отображать список указанных элементов, и, при клике на них (или выборе одного из вариантов ответа), выводить информацию, что за объект инициировал событие (например: id, имя)
 
 Ссылка на JSON-файл: https://pryaniky.com/static/json/sample.json (data - данные, view - что и в каком порядке выводить)
 Используемый язык: Swift
 Предпочтительный паттерн при реализации приложения: MVVM
 Навык использования Pods (Moya, Alamofire, Kingfisher и т.п.) будет плюсом.
 Знакомство с RxSwift будет плюсом
 */


import UIKit
class FirstViewController: UITableViewController {
    
    private var viewModel: FirstViewModelProtocol! {
        didSet {
            viewModel.fetchDataModel {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FirstViewModel()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnedCell: UITableViewCell
        let block = viewModel.correctInformation[indexPath.row]
        
        switch block.name {
        case "hz":
            let cell = tableView.dequeueReusableCell(withIdentifier: "hz", for: indexPath) as! CellWithText
            cell.viewModel = viewModel.cellWithTextViewModel(indexPath: indexPath)
            returnedCell = cell
            
        case "picture":
            let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath) as! CellWithImage
            cell.viewModel = viewModel.cellWithImageViewModel(indexPath: indexPath)
            returnedCell = cell
            
        case "selector":
            let cell = tableView.dequeueReusableCell(withIdentifier: "selector", for: indexPath) as! CellWithSelector
            cell.viewModel = viewModel.cellWithSelectorViewModel(indexPath: indexPath)
            cell.viewModel.delegate = viewModel as? FirstViewModelDelegate
            returnedCell = cell
            
        default:
            returnedCell = tableView.dequeueReusableCell(withIdentifier: "hz", for: indexPath) as! CellWithText
        }
        return returnedCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        let secondViewModel = viewModel.viewModelForSelectedRow(indexPath: indexPath)
        secondViewController.viewModel = secondViewModel
        show(secondViewController, sender: nil)
    }
}


