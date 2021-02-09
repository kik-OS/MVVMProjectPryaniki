//
//  CellWithText.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 06.02.2021.
//

import UIKit

class CellWithText: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textBlock: UILabel!
    
    var viewModel: CellWithTextViewModelProtocol! {
        didSet {
            title.text = viewModel.blockName
            textBlock.text = viewModel.blockText
            
        }
    
        
    }
    
}
