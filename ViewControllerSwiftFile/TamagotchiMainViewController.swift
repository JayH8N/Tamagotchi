//
//  TamagotchiMainViewController.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/05.
//

import UIKit

class TamagotchiMainViewController: UIViewController {
    
    static let identifier = "TamagotchiMainViewController"

    var type: CharacterType?
    var myName: String = "대장"
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(myName)님의 다마고치"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: fontColor]
        self.setBackgroundColor()
        settingButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "\(myName)님의 다마고치"
    }
    
    
    func settingButton() {
        let settingMark = UIImage(systemName: "person.circle")
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: settingMark, style: .plain, target: self, action: #selector(settingButtonClicked))
        navigationItem.rightBarButtonItem?.tintColor = fontColor
    }
    
    
    @objc
    func settingButtonClicked(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "TamagotchiMain", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: SettingViewController.identifier) as! SettingViewController
        
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
