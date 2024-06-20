//
//  Colors.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 18.05.2024.
//

import Foundation
import UIKit

enum Colors {
    case grayGreen
    case semiWhite
    case yellowWhite
}

extension Colors {
    var color: UIColor {
        switch self {
        case .grayGreen:
            return UIColor(red: 125/255, green: 162/255, blue: 169/255, alpha: 1)
        case .semiWhite:
            return UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        case .yellowWhite:
            return UIColor(red: 1, green: 245/255, blue: 187/255, alpha: 1)
        }
    }
}

let arrayOfMonth = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентярь", "Октябрь", "Ноябрь", "Декабрь", ]


extension UIView {
    func viewController() -> UIViewController? {
        var responder: UIResponder? = self
        while !(responder is UIViewController) {
            responder = responder?.next
            if responder == nil {
                return nil
            }
        }
        return responder as? UIViewController
    }
}



func setAllToRead(){
    for i in 0..<arrayOfResult.count {
        arrayOfResult[i].isRead = true
    }
}

func removeDuplicatesByLink(from mainResults: [Result]) -> [Result] {
   
    var uniqArray : [Result] = []

    for result in mainResults {
        var index = 0
        for smth in uniqArray {
            if result.pubDate == smth.pubDate {
                index = 1
                break
            }
        }
        if index == 0 {
            uniqArray.append(result)
        }
    }
    print("Count : ", uniqArray.count)
    
    return uniqArray
}
