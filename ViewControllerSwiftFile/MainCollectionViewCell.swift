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
        
        setCharacterName()
        setCharacterImage()
        
    }
    
    func setCharacterImage() {
        characterImage.layer.cornerRadius = characterImage.layer.frame.size.width / 2
        characterImage.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        characterImage.layer.borderWidth = 2
    }
    
    func setCharacterName() {
        characterName.layer.borderColor = UIColor.lightGray.cgColor
        characterName.layer.borderWidth = 1
        characterName.layer.cornerRadius = 5
    }
    
    
    func setCell() {
        
    }
    
    
    
    

}
