//
//  MessageView.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 26.05.2024.
//


//MARK: - Message with circle icon (cells for main stack view)


import Foundation
import UIKit
class MessageView : UIView  {
    
    
    var savedCountry = ""
    
    let messageStackView : MainNewsStackViewMessage = {
        let messageStackView = MainNewsStackViewMessage()
        messageStackView.translatesAutoresizingMaskIntoConstraints = false
        messageStackView.newsImage.layer.masksToBounds = true
        return messageStackView
    }()
    
    let circleImageView: UIView = {
        let circleImageView = UIView()
        
        circleImageView.layer.borderColor = Colors.semiWhite.color.cgColor
        circleImageView.layer.borderWidth = 2
        circleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .center
            imageView.contentMode = .scaleToFill
            return imageView
        }()
        
        
        circleImageView.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: circleImageView.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: circleImageView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor).isActive = true

        circleImageView.clipsToBounds = true
        return circleImageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(messageStackView)
        addSubview(circleImageView)
        

        
        
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(openCountry))
//        circleImageView.addGestureRecognizer(tapRecognizer)
//        circleImageView.backgroundColor = .blue
        
        messageStackView.backgroundColor = Colors.semiWhite.color
        NSLayoutConstraint.activate([
            circleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            circleImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            circleImageView.widthAnchor.constraint(equalToConstant: 40),
            circleImageView.heightAnchor.constraint(equalTo: circleImageView.widthAnchor),
            
            messageStackView.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 8),
            messageStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            messageStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            messageStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    func configure(currentNews : Result) {
        messageStackView.configure(currentNews: currentNews)
        
        
//        if currentNews.isRead == false {
//            backgroundColor = Colors.yellowWhite.color
//        }
//
        var code = ""
        for i in 0..<arrayOfAllCountries.count {
            if let currentCountry = currentNews.country?[0].lowercased(){

                if  arrayOfAllCountries[i].countryName.lowercased() == currentCountry{
                    code = arrayOfAllCountries[i].countryCode
                    break
                }
            }
        }
//        guard let url = URL(string: "https://ipdata.co/flags/\(code).png") else {
//            return
//        }
//        do {
//            let imageData = try Data(contentsOf: url)
//            (self.circleImageView.subviews.first as? UIImageView)?.image = UIImage(data: imageData)
//        } catch {
//            print("Error loading image: (error)")
//        }
        Task {
            var savedCountry = arrayOfAllCountries[0]
            for country in arrayOfAllCountries {
                if code == country.countryCode {
                    savedCountry = country
                    break
                }
            }
            
            var country = savedCountry
            await country.loadFlagImage()
            if let image = country.countryImage {
                (self.circleImageView.subviews.first as? UIImageView)?.image = image
            } else {
                (self.circleImageView.subviews.first as? UIImageView)?.image = UIImage(systemName: "questionmark.circle")
                print("Image loading failed.")
            }
        }
        
        
        addRecognizerForCircle()
        
        savedCountry = currentNews.country?[0] ?? ""
        
        
        
        
    }
    
    func addRecognizerForCircle(){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(openCountry))
        circleImageView.addGestureRecognizer(tapRecognizer)
        circleImageView.backgroundColor = .blue
    }
    
    
    //making circle
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.cornerRadius = circleImageView.frame.height / 2
        circleImageView.clipsToBounds = true
    }
    
    
    
    @objc private func openCountry() {
        if let vc = self.viewController() {
            currentCountry = savedCountry
            let vcToPresent = ShowOnlyOneCountryViewController()
            vc.navigationController?.pushViewController(vcToPresent, animated: true)
        }
    }
}
