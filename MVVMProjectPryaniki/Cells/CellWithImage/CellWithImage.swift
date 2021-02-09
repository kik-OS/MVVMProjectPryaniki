//
//  CellWithImage.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 05.02.2021.
//

import UIKit

class CellWithImage: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imager: UIImageView!
    @IBOutlet weak var subtitle: UILabel!
    
    var viewModel: CellWIthImageViewModelProtocol! {
        didSet {
            title.text = viewModel.blockName
            subtitle.text = viewModel.blockText
            if let imageData = viewModel.imageData {
                imager.image = UIImage(data: imageData)
            }
        }
    }
    
    
}
