// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let newsData = try? JSONDecoder().decode(NewsData.self, from: jsonData)

import Foundation
import Alamofire

// MARK: - NewsData
struct NewsData: Decodable {
    var status: String?
    var totalResults: Int?
    var results: [Result]?
    var nextPage: String?
}

// MARK: - Result
struct Result: Decodable, Hashable {
    var articleID, title: String?
    var link: String?
    var keywords, creator: [String]?
    var videoURL: String?
    var description, content, pubDate: String?
    var imageURL: String?
    var sourceID: String?
    var sourcePriority: Int?
    var sourceURL: String?
    var sourceIcon: String?
    var language: String?
    var country, category: [String]?
    var aiTag, sentiment, sentimentStats, aiRegion: String?
    var aiOrg: String?
    var pubDateAsDate: Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = .autoupdatingCurrent
            guard let pubDateString = pubDate else {
                return nil
            }
            return dateFormatter.date(from: pubDateString)
        }
    var isRead: Bool?
}
