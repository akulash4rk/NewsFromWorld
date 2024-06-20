//
//  NextNewMessageView.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 10.06.2024.
//

import Foundation
import UIKit

class NextNewMessageView : UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        let label = UILabel()
        addSubview(label)
        
        
        layer.backgroundColor = Colors.semiWhite.color.cgColor
        layer.borderColor = CGColor(gray: 0.5, alpha: 1)
        layer.borderWidth = 2
        
        
        translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalToConstant: 24),
            widthAnchor.constraint(equalToConstant: screenWidth),
            
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        label.textColor = Colors.grayGreen.color
        label.text = "Новые новости"
        label.font = UIFont(name: "Monaco", size: 14)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .black
    }
    
}
