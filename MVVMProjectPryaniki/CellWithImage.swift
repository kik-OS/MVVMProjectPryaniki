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
    

    func configure(block: Datum) {
        title.text = block.name
        subtitle.text = block.data?.text
        if let imageData = ImageManager.shared.fetchImage(from: block.data?.url) {
        imager.image = UIImage(data: imageData)
        }
    }
}
