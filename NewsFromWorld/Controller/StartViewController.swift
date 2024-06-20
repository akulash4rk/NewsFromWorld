//
//  ViewController.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 17.05.2024.
//
//y0_AgAAAABXIT30AATuwQAAAAEFnYtnAACeaGGD7wNMPa-4Xcr36lD5LDNDtg
import UIKit
import Alamofire

var screenWidth = CGFloat()
var screenHeight = CGFloat()
//import AudioToolbox
//mainRequest()
class StartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let idCell = "CellId"
    var myButton = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = createTableView()
        tableView.backgroundColor = Colors.semiWhite.color
        screenWidth = view.bounds.size.width
        screenHeight = view.bounds.size.height
        view.addSubview(tableView)
        
        myButton = createNextButton()
                
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        tableView.register(StartViewControllerCell.self, forCellReuseIdentifier: idCell)
    
        
    }
    
    func createTableView() -> UITableView {
        let tableView = UITableView()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }
    
    func createNextButton() -> UIView {
        let fixedView = UIView()
        
        fixedView.backgroundColor = UIColor.red
        fixedView.frame = CGRect(x: 64 , y: (view.frame.size.height + 32), width: view.frame.size.width - 128, height: 32 )
        fixedView.layer.cornerRadius = 15
        fixedView.backgroundColor = Colors.grayGreen.color
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonPressed))
        fixedView.addGestureRecognizer(tapGesture)
        
        
        view.addSubview(fixedView)
        
        let labelNext = UILabel()
        labelNext.text = "Продолжить"
        
        fixedView.addSubview(labelNext)
        labelNext.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelNext.centerXAnchor.constraint(equalTo: fixedView.centerXAnchor),
            labelNext.centerYAnchor.constraint(equalTo: fixedView.centerYAnchor)
        ])
        
        
        return fixedView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfAllCountries.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.size.height / 16
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! StartViewControllerCell
        
        
        Task {
            var country = arrayOfAllCountries[indexPath.row]
            await country.loadFlagImage()
            if let image = country.countryImage {
                cell.countryImage.image = image
            } else {
                cell.countryImage.image = UIImage(systemName: "questionmark.circle")
                print("Image loading failed.")
            }
        }
        
      //  cell.countryImage.image = arrayOfAllCountries[indexPath.row].countryImage ?? UIImage(systemName: "questionmark.circle")
        
        
        cell.countryName.text = arrayOfAllCountries[indexPath.row].countryName
        
        if arrayOfAllCountries[indexPath.row].isPicked == false {
            cell.checkMark.image =  UIImage(systemName: "circle")
        }
        else {
            cell.checkMark.image =  UIImage(systemName: "checkmark.circle")
        }
        
        cell.backgroundColor = Colors.semiWhite.color
        
        return cell
    }
    
    func animateButtonIn(fixedView : UIView){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: { [self] in
            fixedView.frame.origin.y -= myButton.frame.size.height + 64
        }, completion: nil)
    }
    
    func animateButtonOut(fixedView : UIView){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: { [self] in
            fixedView.frame.origin.y -= myButton.frame.size.height - 128
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let savedCount = arrayOfAvaibleCountries.count
        
        if let cell = tableView.cellForRow(at: indexPath) as? StartViewControllerCell {
            
            if arrayOfAllCountries[indexPath.row].isPicked == false {
                arrayOfAllCountries[indexPath.row].isPicked = true
                cell.checkMark.image =  UIImage(systemName: "checkmark.circle")
                arrayOfAvaibleCountries.append(arrayOfAllCountries[indexPath.row])
            }
            else {
                arrayOfAllCountries[indexPath.row].isPicked = false
                cell.checkMark.image =  UIImage(systemName: "circle")
                
                for i in 0..<arrayOfAvaibleCountries.count {
                    if arrayOfAvaibleCountries[i].countryName == arrayOfAllCountries[indexPath.row].countryName {
                        arrayOfAvaibleCountries.remove(at: i)
                        break
                    }
                }
                
            }
            
            print(arrayOfAvaibleCountries)
            
            if savedCount == 0 && arrayOfAvaibleCountries.count > 0 {
                self.animateButtonIn(fixedView: self.myButton)
                // AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            }
            
            if arrayOfAvaibleCountries.count == 0 {
                self.animateButtonOut(fixedView: self.myButton)
                // AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            }
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
     //   tableView.reloadData()
        
    }
    
    
    @objc func buttonPressed(){
        
        createLoading(view: view)
        let coreData = CoreDataManager()
        coreData.removeAllCountry()
        
        for i in 0..<arrayOfAvaibleCountries.count {
            coreData.createCountry(pickedCountry: arrayOfAvaibleCountries[i])
        }
        
        startTask { [weak self] in
            DispatchQueue.main.async {
                let mainNewsVC = MainNewsViewController()
                self?.navigationController?.setViewControllers([mainNewsVC], animated: true)
            }
        }
    }
    
    @objc func testButton(){
        let mainNewsVC = MainNewsViewController()
        self.navigationController?.setViewControllers([mainNewsVC], animated: true)
    }
}
