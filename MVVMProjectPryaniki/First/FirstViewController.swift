//
//  FirstViewController.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 05.02.2021.
//

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
            cell.viewModel.delegate = self
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
        secondViewController.viewModel.selectedIndexFromSelector = viewModel.selectedIndex
        show(secondViewController, sender: nil)
    }
    

}

extension FirstViewController: FirstViewControllerDelegate {
    func setValue(index: Int) {
        viewModel.selectedIndex = index
    }
}


