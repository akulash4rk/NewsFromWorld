//
//  CountyCell.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 17.05.2024.
//

import Foundation
import UIKit

class StartViewControllerCell : UITableViewCell {
    
    let countryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = Colors.grayGreen.color.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
     let countryName : UILabel = {
        let countryName = UILabel()
         countryName.textColor = .black
        return countryName
    }()
    
    var checkMark : UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.layer.borderWidth = 0
        imageView.tintColor = Colors.grayGreen.color
        return imageView
    }()
    
    private func setupViews() {
        
        addSubview(countryImage)
        addSubview(checkMark)
        addSubview(countryName)
        
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryName.translatesAutoresizingMaskIntoConstraints = false
        checkMark.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countryImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            countryName.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkMark.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            countryImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            countryName.leadingAnchor.constraint(equalTo: countryImage.trailingAnchor, constant: 16),
            checkMark.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            checkMark.widthAnchor.constraint(equalTo: countryImage.widthAnchor),
            checkMark.heightAnchor.constraint(equalTo: countryImage.heightAnchor),
            
            countryImage.heightAnchor.constraint(equalTo: heightAnchor, constant: -24),
            countryImage.widthAnchor.constraint(equalTo: heightAnchor, constant: -24)
        ])
        
        countryImage.layer.borderColor = Colors.grayGreen.color.cgColor // Add border color
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupViews()
       }

       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        countryImage.layer.cornerRadius = min(countryImage.frame.height / 2, countryImage.frame.width / 2)
        countryImage.clipsToBounds = true
    }
}
