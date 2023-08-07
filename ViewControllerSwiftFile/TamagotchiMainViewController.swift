//
//  TamagotchiMainViewController.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/05.
//

import UIKit

var myName: String = "대장"

class TamagotchiMainViewController: UIViewController, UITextFieldDelegate {
    
    static let identifier = "TamagotchiMainViewController"
    
    var type = 0
    
    
    var level: Int = 1
    var rice: Int = 0 {
        didSet {
            feeding()
            setValueRice()
        }
    }
    var water: Int = 0 {
        didSet {
            feeding()
            setValueWater()
        }
    }

    func basicValue() {
        if type == 0 {
            rice = UserDefaults.standard.integer(forKey: ForKey.rice1.rawValue)
            water = UserDefaults.standard.integer(forKey: ForKey.water1.rawValue)
        } else if type == 1 {
            rice = UserDefaults.standard.integer(forKey: ForKey.rice2.rawValue)
            water = UserDefaults.standard.integer(forKey: ForKey.water2.rawValue)
        } else {
            rice = UserDefaults.standard.integer(forKey: ForKey.rice3.rawValue)
            water = UserDefaults.standard.integer(forKey: ForKey.water3.rawValue)
        }
    }
    
    func setValueRice() {
        if type == 0 {
            UserDefaults.standard.set(rice, forKey: ForKey.rice1.rawValue)
        } else if type == 1 {
            UserDefaults.standard.set(rice, forKey: ForKey.rice2.rawValue)
        } else {
            UserDefaults.standard.set(rice, forKey: ForKey.rice3.rawValue)
        }
    }
    
    func setValueWater() {
        if type == 0 {
            UserDefaults.standard.set(water, forKey: ForKey.water1.rawValue)
        } else if type == 1 {
            UserDefaults.standard.set(water, forKey: ForKey.water2.rawValue)
        } else {
            UserDefaults.standard.set(water, forKey: ForKey.water3.rawValue)
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
        type = UserDefaults.standard.integer(forKey: "type")
        toolBar.isHidden = true
        feedRice.delegate = self
        feedWater.delegate = self
        self.title = "\(myName)님의 다마고치"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: fontColor]
        self.navigationController?.navigationBar.layer.addBorder([.bottom], width: 0.3)
        self.setBackgroundColor()
        settingButton()
        setMain()
        setMention()
        setUIButton(button: feedRiceButton, image: "drop.circle", text: "밥먹기")
        setUIButton(button: feedWaterButton, image: "leaf.circle", text: "물먹기")
        load()
        setTextField()
        basicValue()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "\(myName)님의 다마고치"
        setMention()
        var x = ""
        if type == 0 {
            characterInfo.text = UserDefaults.standard.string(forKey: ForKey.result1.rawValue)
        } else if type == 1 {
            characterInfo.text = UserDefaults.standard.string(forKey: ForKey.result2.rawValue)
        } else {
            characterInfo.text = UserDefaults.standard.string(forKey: ForKey.result3.rawValue)
        }
        //characterInfo.text = "LV\(level) · 밥알 \(rice)개 · 물방울 \(water)개"
        print(water)
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
//        if type == 0 {
//            characterInfo.text = UserDefaults.standard.string(forKey: ForKey.result1.rawValue)
//        } else if type == 1 {
//            characterInfo.text = UserDefaults.standard.string(forKey: ForKey.result2.rawValue)
//        } else {
//            characterInfo.text = UserDefaults.standard.string(forKey: ForKey.result3.rawValue)
//        }
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
        case 0:
            characterImage.image = UIImage(named: "1-1")
            characterName.text = "따끔따끔 다마고치"
        case 1:
            characterImage.image = UIImage(named: "2-1")
            characterName.text = "방실방실 다마고치"
        case 2:
            characterImage.image = UIImage(named: "3-1")
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
        default: break
        }
        
        let result = "LV\(level) · 밥알 \(rice)개 · 물방울 \(water)개"
        if type == 0 {
            UserDefaults.standard.set(result, forKey: ForKey.result1.rawValue)
        } else if type == 1 {
            UserDefaults.standard.set(result, forKey: ForKey.result2.rawValue)
        } else {
            UserDefaults.standard.set(result, forKey: ForKey.result3.rawValue)
        }
        
        var x = ""
        if type == 0 {
            x = ForKey.result1.rawValue
        } else if type == 1{
            x = ForKey.result2.rawValue
        } else {
            x = ForKey.result3.rawValue
        }
        
        if level == 10 {
            characterInfo.text = UserDefaults.standard.string(forKey: x)
            level = 9
            characterImage.image = UIImage(named: "\(type + 1)-\(level)")
        } else {
            characterImage.image = UIImage(named: "\(type + 1)-\(level)")
            characterInfo.text = UserDefaults.standard.string(forKey: x)
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
