//
//  News+CoreDataProperties.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 18.06.2024.
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var author: String?
    @NSManaged public var country: String?
    @NSManaged public var data: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var isRead: Bool
    @NSManaged public var news: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?

}

extension News : Identifiable {

}
