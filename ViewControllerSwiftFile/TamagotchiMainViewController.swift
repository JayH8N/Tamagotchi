//
//  TamagotchiMainViewController.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/05.
//

import UIKit

var myName: String = "대장" {
    didSet {
    }
}

class TamagotchiMainViewController: UIViewController, UITextFieldDelegate {
    
    static let identifier = "TamagotchiMainViewController"

    var type: CharacterType?
    
    var level: Int = 1
    var rice: Int = 0 {
        didSet{
            feeding()
        }
    }
    var water: Int = 0 {
        didSet{
            feeding()
        }
    }
    
        
    @IBOutlet var mentionImage: UIImageView!
    @IBOutlet var mention: UILabel!
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterInfo: UILabel!
    
    @IBOutlet var feedRice: UITextField!
    @IBOutlet var feedWater: UITextField!
    @IBOutlet var feedRiceButton: UIButton!
    @IBOutlet var feedWaterButton: UIButton!
    
    @IBOutlet var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toolBar.isHidden = true
        feedRice.delegate = self
        self.title = "\(myName)님의 다마고치"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: fontColor]
        self.setBackgroundColor()
        settingButton()
        setMain()
        setMention()
        setUIButton(button: feedRiceButton, image: "drop.circle", text: "밥먹기")
        setUIButton(button: feedWaterButton, image: "leaf.circle", text: "물먹기")
        load()
        setTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "\(myName)님의 다마고치"
        setMention()
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
        characterInfo.text = "LV\(level) · 밥알 \(rice)개 · 물방울 \(water)개"
        characterInfo.font = UIFont.boldSystemFont(ofSize: 13)
        feedRice.borderStyle = .none
        feedWater.borderStyle = .none
        feedRice.layer.addBorder([.bottom], width: 0.5)
        feedWater.layer.addBorder([.bottom], width: 0.5)
        mention.numberOfLines = 0
        mention.textAlignment = .center
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
    
    func setTextField() {
        feedRice.placeholder = "밥 주세용"
        feedWater.placeholder = "물 주세용"
        feedRice.textAlignment = .center
        feedWater.textAlignment = .center
    }
    
    func load() {
        switch type {
        case .a:
            characterImage.image = UIImage(named: "\(CharacterType.a.rawValue + 1)-1")
            characterName.text = "따끈따끈 다마고치"
        case .b:
            characterImage.image = UIImage(named: "\(CharacterType.b.rawValue + 1)-1")
            characterName.text = "방실방실 다마고치"
        case .c:
            characterImage.image = UIImage(named: "\(CharacterType.c.rawValue + 1)-1")
            characterName.text = "반짝반짝 다마고치"
        default:
            break
        }
    }
    
    func feeding() {
        func levelCalculate() -> Double {
            return (Double(rice) / Double(5)) + (Double(water) / Double(2))
        }
        
        let preLevel = levelCalculate()
    
        switch preLevel {
        case 0..<10: level = 1
        case 10..<20: level = 1
        case 20..<30: level = 2
        case 30..<40: level = 3
        case 40..<50: level = 4
        case 50..<60: level = 5
        case 60..<70: level = 6
        case 70..<80: level = 7
        case 80..<90: level = 8
        case 90..<100: level = 9
        case 100...: level = 10
            self.alert(title: "최고레벨 달성!, 다른 캐릭터 선택 ㄱ?")
        default: break
        }
        
        if level == 10 {
            characterInfo.text = "LV\(level) · 밥알 \(rice)개 · 물방울 \(water)개"
            level = 9
            characterImage.image = UIImage(named: "\(type!.rawValue + 1)-\(level)")
        } else {
            characterImage.image = UIImage(named: "\(type!.rawValue + 1)-\(level)")
            characterInfo.text = "LV\(level) · 밥알 \(rice)개 · 물방울 \(water)개"
        }
    }
    
    //1.텍스트필드 편집이 시작될때 (커서가 시작될 때)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        toolBar.isHidden = false
    }
    
    func setMention() {
        let lowLevelment = ["\(myName)님, 밥주세요", "좋은 하루입니다?? \(myName)", "\(myName)님, 빨리 달란 말이에요!", "\(myName)님, 먹을거주면 친구 해줄게"]
        let middleLevelment = ["\(myName)님, 심보가 왜그러니? 조금 더줘라", "\(myName), 솔직히 조금만 더 주자?", "빨리 줘 나 목말라, 배고파", "\(myName)님 손가락 움직이자?^^"]
        let highLevelment = ["\(myName)님 이제 그만 줘, 배부르다.", "\(myName)님 이제 님이 드세요"]
        
        switch level {
        case 1...3:
            mention.text = lowLevelment.randomElement()
        case 4...8:
            mention.text = middleLevelment.randomElement()
        case 9...:
            mention.text = highLevelment.randomElement()
        default:
            break
        }
    }
    
    
    @IBAction func feedRiceButtonClicked(_ sender: UIButton) {
        setMention()
        let text1 = feedRice.text
        if text1 == "" {
            rice += 1
        } else if  text1!.allSatisfy({$0.isNumber}) && Int(text1!)! <= 99 {
            rice += Int(text1!)!
            feedRice.text = ""
        } else {
            self.alertOnly1Button(title: "잘못된 입력입니다.")
        }
    }
    
    @IBAction func feedWaterButtonClicked(_ sender: UIButton) {
        setMention()
        let text2 = feedWater.text
        if text2 == "" {
            water += 1
        } else if  text2!.allSatisfy({$0.isNumber}) && Int(text2!)! <= 49 {
            water += Int(text2!)!
            feedWater.text = ""
        } else {
            self.alertOnly1Button(title: "잘못된 입력입니다.")
        }
    }
    
    @IBAction func doneButtonClicked(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        toolBar.isHidden = true
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}
