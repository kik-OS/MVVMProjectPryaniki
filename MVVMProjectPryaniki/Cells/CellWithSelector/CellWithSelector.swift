//
//  CellWithSelector.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 06.02.2021.
//

import UIKit

class CellWithSelector: UITableViewCell {
    
    var viewModel: CellWithSelectorViewModelProtocol! {
        didSet {
            title.text = viewModel.blockName
            if let variants = viewModel.variants {
                selector.removeAllSegments()
                for variant in 0..<variants.count {
                    selector.insertSegment(withTitle: variants[variant].text, at: variant, animated: false)
                }
            }
            selector.selectedSegmentIndex = viewModel.calculateIndexFromId()
            
        }
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var selector: UISegmentedControl!
    
    @IBAction func selectorAction() {
        viewModel.delegate?.updateValueFromSelector(newValue: selector.selectedSegmentIndex)
    }
    
}
