//
//  FixedUIView.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 18.05.2024.
//

import Foundation
import UIKit

class FixedButton: UIButton {
    let fixedButton : UIButton =  {
        let fixedButton = UIButton()
        fixedButton.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        fixedButton.setTitle("Продолжить", for: .normal)
        return fixedButton
    }()
}
