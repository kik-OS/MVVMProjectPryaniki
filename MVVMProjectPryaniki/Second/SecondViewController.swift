//
//  SecondViewController.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 07.02.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var viewModel: SecondViewModelProtocol!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var identificator: UILabel!
    @IBOutlet weak var imager: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI() {
        viewModel.confugure()
        nameLabel.text = viewModel.blockName
        subtitle.text = viewModel.blockText
        if let imageData = viewModel.imageData {
            imager.image = UIImage(data: imageData)
            imager.alpha = 1
        }
        if let id = viewModel.blockId {
            identificator.text = id
            identificator.alpha = 1
        }
    }
    
    
}
