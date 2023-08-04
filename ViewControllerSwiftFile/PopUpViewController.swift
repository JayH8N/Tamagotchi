//
//  PopUpViewController.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/04.
//

import UIKit






class PopUpViewController: UIViewController {

    static let identifier = "PopUpViewController"
    
    //값전달
    var image: String?
    var name: String?
    var intro: String?
    
    
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
    }

}
