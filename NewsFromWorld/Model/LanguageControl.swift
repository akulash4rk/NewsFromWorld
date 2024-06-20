//
//  LanguageControl.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 23.05.2024.
//

import Foundation
import SwiftTranslate

let dictionaryOfLanguage : [String : String] = ["arabic" : "ar",
                                                "azerbaijani" : "az",
                                                "chinese" : "zh",
                                                "czech" : "cs",
                                                "danish" : "da",
                                                "dutch" : "nl",
                                                "english" : "en",
                                                "esperanto" : "eo",
                                                "finnish" : "fi",
                                                "french" : "fr",
                                                "german" : "de",
                                                "greek" : "el",
                                                "hebrew" : "he",
                                                "hindi" : "hi",
                                                "hungarian" : "hu",
                                                "indonesian" : "id",
                                                "irish" : "ga",
                                                "italian" : "it",
                                                "japanese" : "ja",
                                                "kabyle" : "kab",
                                                "korean" : "ko",
                                                "occitan" : "oc",
                                                "persian" : "fa",
                                                "polish" : "pl",
                                                "portuguese" : "pt",
                                                "russian" : "ru",
                                                "slovak" : "sk",
                                                "spanish" : "es",
                                                "swedish" : "sv",
                                                "turkish" : "tr",
                                                "ukrainian" : "uk",
                                                "vietnamese" : "vi"
]


struct ResponseData: Codable {
    let data: [DataElement]
    let lang: String?
}

struct DataElement: Codable {
    let innerData: [InnerDataElement]
}

struct InnerDataElement: Codable {
    let textRU: String
    let textEN: String
}



func translate(sourceText: String, sourceLanguage: String, targetLanguage: String, completion: @escaping (String?) -> Void) {
    guard let encodedText = sourceText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
          let url = URL(string: "https://translate.googleapis.com/translate_a/single?client=gtx&dt=t&sl=\(sourceLanguage)&tl=\(targetLanguage)&q=\(encodedText)") else {
        completion(nil)
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("Error: \(error)")
            completion(nil)
            return
        }

        guard let data = data else {
            completion(nil)
            return
        }

        do {
            let responseString = String(data: data, encoding: .utf8)
            if let startIndex = responseString?.firstIndex(of: "\""),
               let substringStartIndex = responseString?.index(after: startIndex),
               let endIndex = responseString?[substringStartIndex...].firstIndex(of: "\"") {
                
                let extractedSubstring = String(responseString![substringStartIndex..<endIndex])
                completion(extractedSubstring)
                
                
            } else {
                completion(nil)
            }

        } catch {
        }

    }

    task.resume()
}
