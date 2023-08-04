//
//  MainCollectionViewCell.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/04.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"
    
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        characterName.setUILabel()
        characterImage.setImageView(characterImage)
    }
    
    
    func setCell(data: Tamagotchi) {
        characterImage.image = UIImage(named: data.image)
        characterName.text = data.title
    }
    
    
}
