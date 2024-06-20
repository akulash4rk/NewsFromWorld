//
//  RequestAPI.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 17.05.2024.
//
//https://github.com/Alamofire/Alamofire.git

import Foundation
import Alamofire

// TEST DATA //
//var arrayOfResult : [Result] = [
//    Result(articleID: nil, title: Optional("Госдеп США: Помощь из предыдущих пакетов уже дошла до линии фронта в Украине"), link: Optional("https://charter97.org/ru/news/2024/5/25/596364/"), keywords: Optional(["политика"]), creator: nil, videoURL: nil, description: Optional("США уже подготовили новый пакет."), content: Optional("ONLY AVAILABLE IN PAID PLANS"), pubDate: Optional("2024-05-25 00:14:00"), imageURL: "https://i.pinimg.com/170x/0f/21/41/0f214197760782d74041f0e147ee215b.jpg", sourceID: nil, sourcePriority: nil, sourceURL: nil, sourceIcon: nil, language: Optional("russian"), country: Optional(["belarus"]), category: Optional(["top"]), aiTag: nil, sentiment: Optional("ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS"), sentimentStats: nil, aiRegion: nil, aiOrg: nil, isRead: true),
//    Result(articleID: nil, title: Optional("Adler Group Reaches A Binding Agreement With Bondholders For A Comprehensive Recapitalisation"), link: Optional("https://menafn.com/1108255760/Adler-Group-Reaches-A-Binding-Agreement-With-Bondholders-For-A-Comprehensive-Recapitalisation"), keywords: nil, creator: Optional(["marketing@menafn.com (MENAFN)"]), videoURL: nil, description: Optional("(MENAFN - EQS Group) EQS-News: Adler Group S.A. / Key word(s): Capital ReorganisationAdler Group reaches a binding agreement with bondholders for a comprehensive recapitalisation 24.05.2024 / ..."), content: Optional("ONLY AVAILABLE IN PAID PLANS"), pubDate: Optional("2024-05-24 23:23:41"), imageURL: "https://avatars.mds.yandex.net/get-entity_search/2028178/494640495/S600xU_2x", sourceID: nil, sourcePriority: nil, sourceURL: nil, sourceIcon: nil, language: Optional("english"), country: Optional(["lithuania", "moldova", "finland", "ukraine", "united kingdom", "kosovo", "ireland", "norway", "monaco", "malta", "vatican", "italy", "sweden", "russia", "austria", "montenegro", "bulgaria", "switzerland", "denmark", "czech republic", "slovakia", "germany", "slovenia", "san marino", "albania", "greece", "estonia", "liechtenstein", "belgium", "macedonia", "iceland", "serbia", "luxembourg", "belarus", "andorra", "spain", "latvia", "hungary", "netherland", "poland", "romania", "france", "portugal", "bosnia and herzegovina", "cyprus"]), category: Optional(["top"]), aiTag: nil, sentiment: Optional("ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS"), sentimentStats: nil, aiRegion: nil, aiOrg: nil, isRead: true),
//    Result(articleID: nil, title: Optional("MONTH-END PORTFOLIO DATA NOW AVAILABLE FOR ARES DYNAMIC CREDIT ALLOCATION FUND, INC."), link: Optional("https://menafn.com/1108255759/MONTH-END-PORTFOLIO-DATA-NOW-AVAILABLE-FOR-ARES-DYNAMIC-CREDIT-ALLOCATION-FUND-INC"), keywords: nil, creator: Optional(["marketing@menafn.com (MENAFN)"]), videoURL: nil, description: Optional("(MENAFN - EQS Group) , 05/24/2024 / 16:15, EST/EDT - EQS Newswire - Ares Dynamic Credit Allocation Fund (NYSE)Ares Capital Management II LLC today announced that monthly fund composition and ..."), content: Optional("ONLY AVAILABLE IN PAID PLANS"), pubDate: Optional("2024-05-24 23:23:40"), imageURL: nil, sourceID: nil, sourcePriority: nil, sourceURL: nil, sourceIcon: nil, language: Optional("english"), country: Optional(["lithuania", "moldova", "finland", "ukraine", "united kingdom", "kosovo", "ireland", "norway", "monaco", "malta", "vatican", "italy", "sweden", "russia", "austria", "montenegro", "bulgaria", "switzerland", "denmark", "czech republic", "slovakia", "germany", "slovenia", "san marino", "albania", "greece", "estonia", "liechtenstein", "belgium", "macedonia", "iceland", "serbia", "luxembourg", "belarus", "andorra", "spain", "latvia", "hungary", "netherland", "poland", "romania", "france", "portugal", "bosnia and herzegovina", "cyprus"]), category: Optional(["top"]), aiTag: nil, sentiment: Optional("ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS"), sentimentStats: nil, aiRegion: nil, aiOrg: nil, isRead: true),
//    Result(articleID: nil, title: Optional("Последний звонок прозвучал в Бресте для лучших учащихся республики"), link: Optional("https://www.sb.by/articles/yarkogo-vam-budushchego-v-rodnoy-strane.html"), keywords: Optional(["общество"]), creator: Optional(["SB.BY"]), videoURL: nil, description: nil, content: Optional("ONLY AVAILABLE IN PAID PLANS"), pubDate: Optional("2024-05-24 23:11:00"), imageURL: nil, sourceID: nil, sourcePriority: nil, sourceURL: nil, sourceIcon: nil, language: Optional("russian"), country: Optional(["belarus"]), category: Optional(["top"]), aiTag: nil, sentiment: Optional("ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS"), sentimentStats: nil, aiRegion: nil, aiOrg: nil, isRead: true),
//    Result(articleID: nil, title: Optional("Путин сообщил о включении Беларуси в ШОС"), link: Optional("https://charter97.org/ru/news/2024/5/25/596363/"), keywords: Optional(["политика"]), creator: nil, videoURL: nil, description: Optional("В июле."), content: Optional("ONLY AVAILABLE IN PAID PLANS"), pubDate: Optional("2024-05-24 22:36:00"), imageURL: nil, sourceID: nil, sourcePriority: nil, sourceURL: nil, sourceIcon: nil, language: Optional("russian"), country: Optional(["belarus"]), category: Optional(["top"]), aiTag: nil, sentiment: Optional("ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS"), sentimentStats: nil, aiRegion: nil, aiOrg: nil, isRead: true)]
// TEST DATA //

var arrayOfResult : [Result] = []
var savedIndex = 0
var newNewsResult : [Result] = []


func mainRequest(countries: [CountryList], completion: @escaping (Bool) -> Void) {


    //key was changed.
    for i in 0..<countries.count {
        let link = "https://newsdata.io/api/1/latest?apikey=pub_44772a649f38d10b991352b0337435704b073&country=" + countries[i].countryCode
   //     let link = "https://newsdata.io/api/1/latest?apikey=pub_440033ed79007e8a50438cf97e3fd4592a5b4"
        AF.request(link).responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let newsResponse = try JSONDecoder().decode(NewsData.self, from: jsonData)
                    if let currentResult = newsResponse.results {
                        
                        savedIndex = arrayOfResult.count
                        newNewsResult.append(contentsOf: currentResult)
                    }
                } catch {
                    print("Ошибка при декодировании данных: (error)")
                }
            case .failure(let error):
                print("Ошибка при запросе данных: (error)")
            }
        }
    }
    
    
    let success = true
    
    completion(success)
}

func testRequest(data: String, completion: @escaping (Bool) -> Void) {
    
    guard let jsonData = data.data(using: .utf8) else {
   //     print("Ошибка при преобразовании строки в данные")
        completion(false)
        return
    }
    
    do {
        let newsResponse = try JSONDecoder().decode(NewsData.self, from: jsonData)
//        print(newsResponse)
        // Печать или обработка новостных данных
        if let currentResult = newsResponse.results {
            var saveCount = arrayOfResult.count
            arrayOfResult.append(contentsOf: newsResponse.results!)
            for i in saveCount..<arrayOfResult.count{
                arrayOfResult[i].isRead = false
            }
        }
        
      //  print(newsResponse.results)
        
        let success = true
        completion(success)
    } catch {
        print("Ошибка при декодировании данных: (error)")
        completion(true)
    }
}



func startTask(completion: @escaping () -> Void){
    testRequest(data: "hello World")
   //mainRequest(countries: arrayOfAvaibleCountries)
    {
        success in
        if success {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                arrayOfResult = removeDuplicatesByLink(from: arrayOfResult)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                
                
                for i in 0..<newNewsResult.count {
                    if let lang = newNewsResult[i].language {
                        if let title = newNewsResult[i].title {
                            translate(sourceText: title, sourceLanguage: lang, targetLanguage: "ru") { translatedText in
                                if let translatedText = translatedText {
                                    newNewsResult[i].title = translatedText
                                } else {
                                    print("Translation failed.")
                                }
                            }
                        }
                        
                        if let news = newNewsResult[i].description{
                            translate(sourceText: news, sourceLanguage: lang, targetLanguage: "ru") { translatedText in
                                if let translatedText = translatedText {
                                    newNewsResult[i].description = translatedText
                                } else {
                                    print("Translation failed.")
                                }
                            }
                        }
                        
                        if let data = newNewsResult[i].country?.count, data > 1 {
                            for j in 0..<arrayOfAvaibleCountries.count{
                                for l in 0..<(newNewsResult[i].country?.count ?? 0) {
                                    if arrayOfAvaibleCountries[j].countryName.lowercased() == newNewsResult[i].country?[l].lowercased() {
                                        newNewsResult[i].country = [arrayOfAvaibleCountries[j].countryName.lowercased()]
                                        break
                                    }
                                }
                            }
                            
                        
                        }
                        
                    }
                    
                    
                    
                }
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    arrayOfResult.append(contentsOf: newNewsResult)
                    
                    var someSet = Set(arrayOfResult)
                    arrayOfResult = Array(someSet)
                    
                    
                    let sortedResults = arrayOfResult.sorted { (result1, result2) -> Bool in
                        guard let date1 = result1.pubDateAsDate, let date2 = result2.pubDateAsDate else {
                            return false
                        }
                        return date1 < date2
                    }
                    
                    
                    arrayOfResult = sortedResults
                    
                    
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        let dataManager = CoreDataManager()
                        dataManager.removeAllData()
                        
                        for i in 0..<arrayOfResult.count {
                            dataManager.createData(currentNews: arrayOfResult[i])
                        }
                        
                //        print("dataManager2 : ", dataManager.readData().count)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            completion()
                        }
                    }
                    
                }
            }
            
        }
    }
    
    
    
}
