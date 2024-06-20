

import UIKit
import SafariServices


//MARK: - Data in message

class MainNewsStackViewMessage: UIStackView {
    
    var link = ""
    
    let newsImage: UIImageView = {
        let newsImage = UIImageView()
        newsImage.clipsToBounds = true
        newsImage.contentMode = .center
//        newsImage.layer.borderWidth = 2
//        newsImage.layer.borderColor = CGColor(red: 1, green: 1, blue: 0, alpha: 1)
    //    newsImage.translatesAutoresizingMaskIntoConstraints = false
        return newsImage
    }()
    
    let stackViewForMessages : UIStackView = {
        let stackViewForMessages = UIStackView()
//        stackViewForMessages.translatesAutoresizingMaskIntoConstraints = false
        stackViewForMessages.axis = .vertical
        
        stackViewForMessages.isLayoutMarginsRelativeArrangement = true
        stackViewForMessages.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        stackViewForMessages.spacing = 8
        return stackViewForMessages
    }()
    
    let newsTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont(name: "Monaco", size: 14)
      //  label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont(name: "Monaco", size: 14)
    //    label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newsAuthor: UILabel = {
        let newsAuthor = UILabel()
        newsAuthor.numberOfLines = 0
        newsAuthor.textColor = .black
        newsAuthor.font = UIFont(name: "Monaco", size: 14)
     //   newsAuthor.translatesAutoresizingMaskIntoConstraints = false
        return newsAuthor
    }()
    
    let newsDate: UILabel = {
        let newsDate = UILabel()
        newsDate.numberOfLines = 0
        newsDate.textColor = .gray
        newsDate.textAlignment = .right
        newsDate.font = UIFont(name: "Monaco", size: 14)
        return newsDate
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        axis = .vertical
        spacing = 8
        layer.cornerRadius = 15
        
        
        //constraints
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: screenWidths.width * 0.8)
        ])
        
        addArrangedSubview(newsImage)
        stackViewForMessages.addArrangedSubview(newsTitle)
        stackViewForMessages.addArrangedSubview(newsLabel)
        stackViewForMessages.addArrangedSubview(newsAuthor)
        stackViewForMessages.addArrangedSubview(newsDate)
        addArrangedSubview(stackViewForMessages)
        
        
        
        newsImage.clipsToBounds = true
        newsImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        newsImage.layer.cornerRadius = 15
        
       // leading and trailing constraints
        for subview in arrangedSubviews {
            if let label = subview as? UILabel {
                label.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
//                    label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//                    label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                ])
                
            }
        }
        
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        
//        newsTitle.layer.borderWidth = 2
//        newsTitle.layer.borderColor = CGColor(red: 1, green: 1, blue: 0, alpha: 1)
        
        NSLayoutConstraint.activate([
//            newsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            newsTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            
//            newsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            newsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            
//            newsAuthor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            newsAuthor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            
//            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            
//            newsDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        
        //top constraints for first label
        if let firstLabel = arrangedSubviews.first as? UILabel {
            NSLayoutConstraint.activate([
                firstLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            ])
        }
    }
    
    func configure(currentNews : Result) {
        
        //image
        loadImage(from: currentNews.imageURL ?? ""){ image in
            if let image = image {
              let newWidth = UIScreen.main.bounds.width * 0.8
              
              let aspectRatio = image.size.width / image.size.height
              let newHeight = newWidth / aspectRatio
              
              let newSize = CGSize(width: newWidth, height: newHeight)
              UIGraphicsBeginImageContext(newSize)
              image.draw(in: CGRect(origin: .zero, size: newSize))
              let newImage = UIGraphicsGetImageFromCurrentImageContext()
              UIGraphicsEndImageContext()

              self.newsImage.image = newImage
            }
        }
        
        //title
        newsTitle.text = currentNews.title
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: newsTitle.font.pointSize)
        ]
        let attributedString = NSAttributedString(string: newsTitle.text ?? "", attributes: attributes)
        newsTitle.attributedText = attributedString
        newsLabel.text = currentNews.description
        
        newsTitle.isUserInteractionEnabled = true
        link = currentNews.link ?? ""
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(openNews))
            newsTitle.addGestureRecognizer(tapRecognizer)
        


        
        //date
        configureDate(currentNews: currentNews)
    
        //Author
        if let labelText = currentNews.creator?[0]{
            newsAuthor.text = labelText
        }
    }
    
    func configureDate(currentNews : Result){
        if let pubDate = currentNews.pubDateAsDate {
            
            var hours = "\(Calendar.current.component(.hour, from: pubDate))"
            if hours.count == 1 {
                hours = "0" + hours
            }
            var minutes = "\(Calendar.current.component(.minute, from: pubDate))"
            if minutes.count == 1 {
                minutes = "0" + minutes
            }



            let defoult = "\(hours):\(minutes)"
            
            
            
            
            let currentYear = Calendar.current.component(.year, from: Date())
            let newsYear = Calendar.current.component(.year, from: pubDate)
            let currentMonth = Calendar.current.component(.month, from: Date())
            let newsMonth = Calendar.current.component(.month, from: pubDate)
            let currentDay = Calendar.current.component(.day, from: Date())
            let newsDay = Calendar.current.component(.day, from: pubDate)
        let inYear = "\(arrayOfMonth[Calendar.current.component(.month, from: pubDate)]) \(newsDay), \(defoult)"
        if currentYear == newsYear {
            if currentMonth == newsMonth {
                if currentDay == newsDay {
                    newsDate.text = defoult
                } else {
                    newsDate.text = inYear
                }
            } else {
                newsDate.text = inYear
            }
        } else {
            newsDate.text = inYear + "\(newsYear)"
        }
    } else {
        print("Дата публикации новости неизвестна")
    }
    }
    
    private func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
    @objc private func openNews(){
        if let url = URL(string: link) {
            
            let safariViewController = SFSafariViewController(url: url)
            if let topController = UIApplication.shared.keyWindow?.rootViewController {
                
                var topViewController = topController
                while let presentedViewController = topViewController.presentedViewController {
                    topViewController = presentedViewController
                }
                
                topViewController.present(safariViewController, animated: true)
            }
        }
    }
}
