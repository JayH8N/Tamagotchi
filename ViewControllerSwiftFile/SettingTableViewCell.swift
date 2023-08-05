//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/05.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    static let identifier = "SettingTableViewCell"
    
    @IBOutlet var leftImage: UIImageView!
    @IBOutlet var settingTitle: UILabel!
    @IBOutlet var changedName: UILabel!
    @IBOutlet var rightImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setCell()
    }

    
    func setCell() {
        rightImage.image = UIImage(systemName: "chevron.forward")
        leftImage.tintColor = fontColor
        changedName.textColor = fontColor
        rightImage.tintColor = fontColor
        changedName.font = UIFont.systemFont(ofSize: 13)
        settingTitle.font = UIFont.boldSystemFont(ofSize: 14)
        settingTitle.textColor = .black
        changedName.text = myName
    }
    

}
