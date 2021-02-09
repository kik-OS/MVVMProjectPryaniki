//
//  CellWithSelector.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 06.02.2021.
//

import UIKit

class CellWithSelector: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var selector: UISegmentedControl!
    var delegate: FirstViewControllerDelegate!
    
    @IBAction func selectorAction() {
        delegate.setValue(index: selector.selectedSegmentIndex)
    }
    
    var viewModel: CellWithSelectorViewModelProtocol! {
        didSet {
            title.text = viewModel.blockName
            selector.selectedSegmentIndex = viewModel.selectedSegmentIndexForSubtitle
            
            if let variants = viewModel.variants {
                selector.removeAllSegments()
                for variant in variants {
                    selector.insertSegment(withTitle: variant.text, at: Int(variant.id ?? 1) - 1, animated: false)
                }
            }
            
        }
    }
}
