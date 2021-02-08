//
//  SecondViewController.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 07.02.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var block: Datum!
    var selectedIndex: Int?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var identificator: UILabel!
    @IBOutlet weak var imager: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    func configure() {
        nameLabel.text = block.name
        
        switch block.name {
        case "hz":
            subtitle.text = block.data?.text
        case "picture":
            subtitle.text = block.data?.text
            guard let imageData = ImageManager.shared.fetchImage(from: block.data?.url) else {return}
            imager.image = UIImage(data: imageData)
            imager.alpha = 1
        case "selector":
            guard let variants = block.data?.variants else {return}
            identificator.alpha = 1
            selectedIndex == nil
                ? setValueWithoutIndex(variants: variants)
                : setValueWithIndex(variants: variants)
        default:
            break
        }
    }
    
    
    func setValueWithoutIndex(variants: [Variant]) {
        guard let index = block.data?.selectedId else {return}
        subtitle.text = "Выбран: \(variants[index - 1].text ?? "")"
        identificator.text = "ID: \(variants[index - 1].id ?? 0)"
    }
    
    func setValueWithIndex(variants: [Variant]) {
        guard let index = selectedIndex else {return}
        subtitle.text = "Выбран: \(variants[index].text ?? "")"
        identificator.text = "ID: \(variants[index].id ?? 0)"
    }
}
