//
//  ShowOnlyOneCountry.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 10.06.2024.
//

import Foundation
import UIKit

class ShowOnlyOneCountryViewController : MainNewsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setContent(){ //
        for i in 0..<arrayOfResult.count {
            if arrayOfResult[i].country?[0].lowercased() == currentCountry.lowercased() {
                let cellForStackView = MessageView()
                cellForStackView.configure(currentNews: arrayOfResult[i])
                cellForStackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview(cellForStackView)
                cellForStackView.circleImageView.isUserInteractionEnabled = false
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func createGear() {}
}
extension ShowOnlyOneCountryViewController {
    
}
