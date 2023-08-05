//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/05.
//

import UIKit

class SettingViewController: UIViewController {
    
    static let identifier = "SettingViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "설정"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = fontColor
        self.setBackgroundColor()
        
    }
    
    
    
    


}
