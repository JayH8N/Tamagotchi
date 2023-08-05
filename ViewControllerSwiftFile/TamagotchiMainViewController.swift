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
        
    @IBOutlet var mentionImage: UIImageView!
    @IBOutlet var mention: UILabel!
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterInfo: UILabel!
    
    @IBOutlet var feedRice: UITextField!
    @IBOutlet var feedWater: UITextField!
    @IBOutlet var feedRiceButton: UIButton!
    @IBOutlet var feedWaterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(myName)님의 다마고치"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: fontColor]
        self.setBackgroundColor()
        settingButton()
        setMain()
        
        setUIButton(button: feedRiceButton, image: "drop.circle", text: "밥먹기")
        setUIButton(button: feedWaterButton, image: "leaf.circle", text: "물먹기")
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
    
    
    func setMain() {
        mentionImage.image = UIImage(named:"bubble")
        characterName.setUILabel()
        characterImage.setImageView(characterImage)
        characterInfo.text = "LV · 밥알 개 · 물방울 개"
        characterInfo.font = UIFont.boldSystemFont(ofSize: 13)
        feedRice.borderStyle = .none
        feedWater.borderStyle = .none
        feedRice.layer.addBorder([.bottom], width: 0.5)
        feedWater.layer.addBorder([.bottom], width: 0.5)
    }
    
    func setUIButton(button: UIButton, image: String, text: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setImage(UIImage(systemName: image), for: .normal)
        button.tintColor = fontColor
        button.setTitle(text, for: .normal)
        button.setTitleColor(fontColor, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 9
        button.layer.borderColor = borderColor
        button.layer.borderWidth = 1
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
    }
    
    
    
    
    
    
}
