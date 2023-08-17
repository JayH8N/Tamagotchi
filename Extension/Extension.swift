//
//  Extension.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/04.
//

import UIKit

let themeColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
let borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
let fontColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)


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

extension UIImageView {
    func setImageView(_ name: UIImageView) {
        self.layer.cornerRadius = name.layer.frame.size.width / 2
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 2
    }
}

extension UIButton {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}

extension UILabel {
    func setUILabel() {
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
}

extension UIView {
    func setUIview() {
        self.backgroundColor = themeColor
    }
}

extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = borderColor
            self.addSublayer(border)
        }
    }
}
