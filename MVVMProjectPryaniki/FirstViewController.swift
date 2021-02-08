//
//  FirstViewController.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 05.02.2021.
//

import UIKit



protocol FirstViewControllerDelegate {
    func setValue(index: Int)
}

class FirstViewController: UITableViewController {
    
    private var dannye: DataModel?
    private var correctInformation: [Datum] = []
    private var selectedIndex: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataModel()
        formingCorrectArrayOfData()
        tableView.reloadData()
    }
    
    private func getDataModel() {
        NetworkManager.shared.fetchData() { dataModel in
            self.dannye = dataModel
            self.formingCorrectArrayOfData()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return correctInformation.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnedCell: UITableViewCell
        let block = correctInformation[indexPath.row]
        
        switch block.name {
        case "hz":
            let cell = tableView.dequeueReusableCell(withIdentifier: "hz", for: indexPath) as! CellWithText
            cell.configure(block: block)
            returnedCell = cell
            
        case "picture":
            let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath) as! CellWithImage
            cell.configure(block: block)
            returnedCell = cell
            
        case "selector":
            let cell = tableView.dequeueReusableCell(withIdentifier: "selector", for: indexPath) as! CellWithSelector
            cell.configure(block: block)
            cell.delegate = self
            returnedCell = cell
            
        default:
            returnedCell = tableView.dequeueReusableCell(withIdentifier: "hz", for: indexPath) as! CellWithText
        }
        return returnedCell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let block = correctInformation[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        secondViewController.block = block
        secondViewController.selectedIndex = selectedIndex 
        show(secondViewController, sender: nil)
    }
    
    
    
    private func formingCorrectArrayOfData() {
        guard let data = dannye?.data else {return}
        guard let view = dannye?.view else {return}
        for poziciya in view {
            for i in data {
                if poziciya == i.name {
                    correctInformation.append(i)
                }
            }
        }
    }

}

extension FirstViewController: FirstViewControllerDelegate {
    func setValue(index: Int) {
        selectedIndex = index
    }
}


