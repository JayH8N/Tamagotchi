//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/05.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
    let imageName = ["pencil", "moon.fill", "arrow.clockwise"]
    
    static let identifier = "SettingViewController"

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "설정"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = fontColor
        self.setBackgroundColor()
        tableView.backgroundColor = themeColor
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 48
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as! SettingTableViewCell
        
        let row = indexPath.row
        cell.backgroundColor = themeColor
        cell.leftImage.image = UIImage(systemName: imageName[row])
        cell.settingTitle.text = list[row]
        if row != 0 {
            cell.changedName.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "TamagotchiMain", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: NameChangeViewController.identifier) as! NameChangeViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
