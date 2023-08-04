//
//  PopUpViewController.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/04.
//

import UIKit


enum CharacterType: Int {
    case a
    case b
    case c
}


class PopUpViewController: UIViewController {
    
    static let identifier = "PopUpViewController"
    
    //값전달
    var image: String?
    var name: String?
    var intro: String?
    
    var type: CharacterType?
    
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var popUpView: UIView!
    @IBOutlet var labelBackView: UIView!
    @IBOutlet var introduction: UILabel!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterImage.setImageView(characterImage)
        characterName.setUILabel()
        setPopUpView()
        setLabelBackVeiw()
        setIntroduction()
        setCancelButton()
        setStartButton()
        callValue()
    }
    
    func setPopUpView() {
        popUpView.setUIview()
        popUpView.layer.cornerRadius = 10
    }
    
    func setLabelBackVeiw() {
        labelBackView.backgroundColor = .clear
        labelBackView.layer.addBorder([.top], width: 0.7)
    }
    
    func setIntroduction() {
        introduction.backgroundColor = .clear
        introduction.numberOfLines = 0
    }
    
    func setCancelButton() {
        cancelButton.layer.addBorder([.top], width: 0.5)
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.tintColor = fontColor
    }
    
    func setStartButton() {
        startButton.layer.addBorder([.top], width: 0.5)
        startButton.setTitle("시작하기", for: .normal)
        startButton.tintColor = fontColor
    }
    
    func callValue() {
        guard let image, let name, let intro else { return }
        characterImage.image = UIImage(named: image)
        characterName.text = name
        introduction.text = intro
    }
    
    func callValue(data: Tamagotchi) {
        image = data.image
        name = data.title
        intro = data.introduction
    }
    
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        guard let type else {
            alert()
            return }
        
        //화면전환
        let sb = UIStoryboard(name: "TamagotchiMain", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: TamagotchiMainViewController.identifier) as! TamagotchiMainViewController
        
        vc.type = self.type
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: true)
    }
    
    func alert() {
        let alert = UIAlertController(title: "존재하지 않는다구~", message: "캐릭터 다시 골라", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}
