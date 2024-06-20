import UIKit
import SwiftUI


//MARK: - View of all messages

var screenWidths = CGSize(width: 0, height: 0)
var elementPositionInScrollView = CGPoint(x: -1, y: -1)

class MainNewsViewController : UIViewController {
    
    let stackView : UIStackView =  {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = Colors.grayGreen.color
        return stackView
    }()
    
    let scrollView = UIScrollView()
    var isNewMessageNotificationOnScreen : Bool?
    var contentOffset = CGPoint(x: 0, y: 0)
    var openCounter = 0
    
    var bottomOffset = CGPoint(x: 0, y: 0)
    var currentOffset = CGPoint(x: 0, y: 0)
    
    var downButton : UIButton? = nil
    var upButton : UIButton? = nil
    
    var isDownButtonOnScreen = false
    var isUpButtonOnScreen = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGear()
        
        navigationController?.hidesBarsOnSwipe = false
        
        scrollView.delegate = self
        
        view.backgroundColor = Colors.grayGreen.color
        screenWidths = CGSize(width: view.frame.width, height: view.frame.height)
        
        
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        stackView.backgroundColor = Colors.grayGreen.color
        scrollView.addSubview(stackView)
        //        scrollView.setContentOffset(CGPoint(x: 0, y: 1000), animated: true)
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        ])
        

        setContent()
        
        
        
        upButton = createUpBtn()
        downButton = createDownBtn()
    }
    
    func createGear(){
        navigationController?.navigationBar.barTintColor = Colors.semiWhite.color
        let gearButton = UIBarButtonItem(image: UIImage(systemName: "gear")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(gearButtonTapped))
        navigationItem.rightBarButtonItem = gearButton
    }
    
    
    func setContent(){

        for i in 0..<arrayOfResult.count {
            let cellForStackView = MessageView()
            cellForStackView.configure(currentNews: arrayOfResult[i])
            cellForStackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(cellForStackView)
            cellForStackView.messageStackView.newsImage.layer.masksToBounds = true
            
            
            if i < arrayOfResult.count-1  {

                //set newMessageTable
                if arrayOfResult[i].isRead == true && arrayOfResult[i+1].isRead != true && isNewMessageNotificationOnScreen != true {
                    let itsNewMessageNotification = NextNewMessageView()
                    itsNewMessageNotification.tag = 1337
                    stackView.addArrangedSubview(itsNewMessageNotification)
                    isNewMessageNotificationOnScreen = true

                    
                    let elementFrameInStackView = itsNewMessageNotification.frame

                        let elementFrameInScrollView = stackView.convert(elementFrameInStackView, to: scrollView)

                        let scrollViewContentOffset = scrollView.contentOffset
                        
                    
                        elementPositionInScrollView = CGPoint(x: elementFrameInScrollView.origin.x + scrollViewContentOffset.x,
                                                              y: elementFrameInScrollView.origin.y + scrollViewContentOffset.y)
                        
                }
            }
            
            if isNewMessageNotificationOnScreen == true {
                
                
                
            }
            
            
            //set min spacing between one country
            if i != arrayOfResult.count-1  {
                if arrayOfResult[i].country == arrayOfResult[i+1].country{
                    stackView.setCustomSpacing(4.0, after: cellForStackView)
                }
            }
            
        }
    }
        
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        
//    }
    
    func scrollToNextNewMessageView() {
        guard let nextNewMessageView = findNextNewMessageView() else { return }

        let viewFrameInStackView = nextNewMessageView.convert(nextNewMessageView.bounds, to: stackView)
        let stackViewFrameInScrollView = stackView.convert(stackView.bounds, to: scrollView)
        let offsetY = stackViewFrameInScrollView.origin.y + viewFrameInStackView.origin.y+200
        var contentOffset = CGPoint(x: 0, y: offsetY)
        scrollView.setContentOffset(contentOffset, animated: true)
    }
    
    func findNextNewMessageView() -> UIView? {
        for view in stackView.arrangedSubviews {
            if view.tag == 1337 { // замените 123 на нужный тег
                return view
            }
        }
        return nil
    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        let maxYOffset = scrollView.contentSize.height + scrollView.contentInset.bottom - scrollView.bounds.size.height
        bottomOffset = CGPoint(x: 0, y: maxYOffset)
        
        if openCounter == 0 {
            openCounter += 1
            guard let nextNewMessageView = findNextNewMessageView() else {
                let contentHeight = scrollView.contentSize.height
                let scrollBounds = scrollView.bounds.size.height
                let offsetYTwo = contentHeight - scrollBounds
                let contentOffset = CGPoint(x: 0, y: offsetYTwo)
                scrollView.setContentOffset(contentOffset, animated: true)
                
                return
            }
            
            let viewFrameInStackView = nextNewMessageView.convert(nextNewMessageView.bounds, to: stackView)
            let stackViewFrameInScrollView = stackView.convert(stackView.bounds, to: scrollView)
            let offsetYOne = viewFrameInStackView.origin.y - ((navigationController?.view.frame.size.height ?? 0) - (navigationController?.view.safeAreaLayoutGuide.layoutFrame.height ?? 0)) // stackViewFrameInScrollView.origin.y
            
            
            let contentHeight = scrollView.contentSize.height
            let scrollBounds = scrollView.bounds.size.height
            let offsetYTwo = contentHeight - scrollBounds
            
            let contentOffset = CGPoint(x: 0, y: min(offsetYOne, offsetYTwo))
            
            
            scrollView.setContentOffset(contentOffset, animated: true)
        }
    }
    
    @objc func gearButtonTapped(){
        let settingsView = CountrySettings()
        navigationController?.pushViewController(settingsView, animated: true)
        
        settingsView.updateData = {
            createLoading(view: self.view)
            startTask { [weak self] in
                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                    
                    self?.stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
                    
                    self?.setContent()
                    if let viewC = self?.view {
                        stopLoading(view: viewC)
                    }
                }
            }
        }
    }
}



// MARK: - ScrollView Delegate
extension MainNewsViewController : UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if 200 < bottomOffset.y -  scrollView.contentOffset.y{
            if let currentBtn = downButton, !isDownButtonOnScreen {
                print("One In downButton")
                isDownButtonOnScreen = true
                buttonIn(button: downButton!)
            }
            if let currentBtn = upButton, isUpButtonOnScreen {
                print("One out upButton")
                isUpButtonOnScreen = false
                buttonOut(button: upButton!)
            }
        }
        if 200 > bottomOffset.y -  scrollView.contentOffset.y{
            print("200 >", bottomOffset.y, " - ",   scrollView.contentOffset.y, " = ", bottomOffset.y -  scrollView.contentOffset.y)
            if let currentBtn = downButton, isDownButtonOnScreen {
                print("Out downButton")
                isDownButtonOnScreen = false
                buttonOut(button: downButton!)
            }
            if let currentBtn = upButton, !isUpButtonOnScreen, currentOffset.y != 0 {
                print("In upButton")
                isUpButtonOnScreen = true
                buttonIn(button: upButton!)
            }
            
            setAllToRead()
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollViewDidEndDecelerating(scrollView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewDidEndDecelerating(scrollView)
    }
}

protocol someProtocol {
    
}



//MARK: - Buttons
extension MainNewsViewController {
    
    
    func buttonIn(button : UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            button.alpha = 1
        })
    }
    func buttonOut(button : UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            button.alpha = 0

        })
    }
    
    
    
    //Up & down buttons
    func createUpBtn() -> UIButton{
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.up"), for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 32),
            button.widthAnchor.constraint(equalToConstant: 32),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
        ])

        settingsButton(button: button)
        
        
        button.addTarget(self, action: #selector(pushingUp), for: .touchUpInside)
        buttonOut(button: button)
        return button
    }
    
    
    
    func createDownBtn() -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.down"), for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 32),
            button.widthAnchor.constraint(equalToConstant: 32),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
        
        button.addTarget(self, action: #selector(pushingDown), for: .touchUpInside)
        
        settingsButton(button: button)
        buttonOut(button: button)
        return button
    }
    
    private func settingsButton(button : UIButton){
        button.backgroundColor = Colors.grayGreen.color
        button.tintColor = Colors.semiWhite.color
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 2
        button.layer.borderColor = Colors.semiWhite.color.cgColor
        
        button.layer.shadowColor = Color.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 0
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}



//MARK: - Actions
extension MainNewsViewController {
    
    @objc private func pushingUp(){
        scrollView.setContentOffset(currentOffset, animated: true)
    }
    
    @objc private func pushingDown(){
        currentOffset = scrollView.contentOffset
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height-scrollView.bounds.size.height), animated: true)
    }
    
    
    
    
}


