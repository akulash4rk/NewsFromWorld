import UIKit

class LoadingView: UIView {
    
    var startYPosition = CGFloat(0.0)
    
    private let stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let circleA = UIView()
    private let circleB = UIView()
    private let circleC = UIView()
    private lazy var circles = [circleA, circleB, circleC]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 110)
        ])
        
        circles.forEach { circle in
            circle.layer.cornerRadius = 10
            circle.layer.masksToBounds = true
            circle.backgroundColor = Colors.grayGreen.color
            stackView.addArrangedSubview(circle)
            circle.widthAnchor.constraint(equalToConstant: 20).isActive = true
            circle.heightAnchor.constraint(equalTo: circle.widthAnchor).isActive = true
        }
        
        backgroundColor = Colors.grayGreen.color.withAlphaComponent(0)
        
        
        animateCirclesWithDelay()
        animateOverlay(toAlpha: 1, duration: 3)
        startYPosition = circles[0].layer.position.y
    }
    //circles in
    func animateCirclesWithDelay() {
        for (index, circle) in circles.enumerated() {
            let delay = (TimeInterval(index) * 0.5)
            
            UIView.animate(withDuration: 1.0, delay: delay, options: [.repeat, .autoreverse], animations: {
                circle.center.y += 15
                circle.alpha -= 0.5
            })
        }
    }
    //background in
    func animateOverlay(toAlpha: CGFloat, duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.backgroundColor = Colors.grayGreen.color.withAlphaComponent(toAlpha)
            self.circles.forEach { circle in
                circle.backgroundColor = Colors.semiWhite.color
            }
        }
    }
    //circles&background out
    func stopAllAnimations(){
        for (index, circle) in circles.enumerated() {
            let delay = (TimeInterval(index) * 0.5)
            UIView.animate(withDuration: 1, delay: delay, animations: {
                self.backgroundColor = Colors.semiWhite.color.withAlphaComponent(0)
                self.circles.forEach { circle in
                    circle.backgroundColor = Colors.grayGreen.color.withAlphaComponent(0)
                }
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 + delay) {
                self.removeFromSuperview()
            }
        }
    }
}


func createLoading(view: UIView){
    
    let loadingView = LoadingView()
    view.addSubview(loadingView)
    loadingView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        loadingView.topAnchor.constraint(equalTo: view.topAnchor),
        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
}


func stopLoading(view: UIView){
    for subview in view.subviews {
        if let loadingView = subview as? LoadingView {
            loadingView.stopAllAnimations()
        }
    }
}

