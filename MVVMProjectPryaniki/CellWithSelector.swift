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
    func configure(block: Datum) {
        title.text = block.name
        
        if let variants = block.data?.variants {
            selector.removeAllSegments()
            for variant in variants {
                selector.insertSegment(withTitle: variant.text, at: Int(variant.id ?? 1) - 1, animated: false)
            }
        }
        if let selectedSegment = block.data?.selectedId {
            selector.selectedSegmentIndex = selectedSegment - 1
        }
    }
}
