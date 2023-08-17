//
//  Extension + UIViewController.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/17.
//

import UIKit

extension UIViewController {
    func setBackgroundColor() {
        view.backgroundColor = themeColor
    }
    
    func alert(title: String, message: String? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Yes", style: .default, handler: handler)
        let cancel = UIAlertAction(title: "No", style: .default)
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
    
    func alertOnly1Button(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}
