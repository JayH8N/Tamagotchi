//
//  Extension + UIImageView.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/17.
//

import UIKit

extension UIImageView {
    func setImageView(_ name: UIImageView) {
        self.layer.cornerRadius = name.layer.frame.size.width / 2
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 2
    }
}
