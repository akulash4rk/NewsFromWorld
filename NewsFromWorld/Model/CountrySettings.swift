//
//  CountrySettings.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 07.06.2024.
//

import Foundation
import UIKit


class CountrySettings : StartViewController {
    
    var updateData: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateButtonIn(fixedView: myButton)
    }
    
    override func createNextButton() -> UIView {
        let fixedView = UIView()
        
        fixedView.backgroundColor = UIColor.red
        fixedView.frame = CGRect(x: 64 , y: (view.frame.size.height + 32), width: view.frame.size.width - 128, height: 32 )
        fixedView.layer.cornerRadius = 15
        fixedView.backgroundColor = Colors.grayGreen.color
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonPressed))
        fixedView.addGestureRecognizer(tapGesture)
        
        
        view.addSubview(fixedView)
        
        let labelNext = UILabel()
        labelNext.text = "Сохранить"
        
        fixedView.addSubview(labelNext)
        labelNext.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelNext.centerXAnchor.constraint(equalTo: fixedView.centerXAnchor),
            labelNext.centerYAnchor.constraint(equalTo: fixedView.centerYAnchor)
        ])
        
        
        return fixedView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let savedCount = arrayOfAvaibleCountries.count
        
        if let cell = tableView.cellForRow(at: indexPath) as? StartViewControllerCell {
            
            
            //set checkmark
            if arrayOfAllCountries[indexPath.row].isPicked == false {
                arrayOfAllCountries[indexPath.row].isPicked = true
                cell.checkMark.image =  UIImage(systemName: "checkmark.circle")
                arrayOfAvaibleCountries.append(arrayOfAllCountries[indexPath.row])
            }
            else {
                arrayOfAllCountries[indexPath.row].isPicked = false
                cell.checkMark.image =  UIImage(systemName: "circle")
                
                for i in 0..<arrayOfAvaibleCountries.count {
                    print(arrayOfAvaibleCountries[i].countryName)
                    print(arrayOfAllCountries[indexPath.row].countryName)
                    if arrayOfAvaibleCountries[i].countryName == arrayOfAllCountries[indexPath.row].countryName {
                        arrayOfAvaibleCountries.remove(at: i)
                        break
                    }
                }
            }
            
            print(arrayOfAvaibleCountries)
            
            
            if savedCount == 0 && arrayOfAvaibleCountries.count > 0 {
                self.animateButtonIn(fixedView: self.myButton)
            }
            
            if arrayOfAvaibleCountries.count == 0 {
                print("sadsad")
                self.animateButtonOut(fixedView: self.myButton)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func buttonPressed(){
        navigationController?.popViewController(animated: true)
        
        let coreData = CoreDataManager()
        coreData.removeAllCountry()
        for i in 0..<arrayOfAvaibleCountries.count {
            coreData.createCountry(pickedCountry: arrayOfAvaibleCountries[i])
        }
        self.updateData?()
    }
}
    
