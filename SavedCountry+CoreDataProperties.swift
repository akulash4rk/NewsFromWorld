//
//  SavedCountry+CoreDataProperties.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 19.06.2024.
//
//

import Foundation
import CoreData


extension SavedCountry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedCountry> {
        return NSFetchRequest<SavedCountry>(entityName: "SavedCountry")
    }

    @NSManaged public var countryName: String?
    @NSManaged public var countryCode: String?

}

extension SavedCountry : Identifiable {

}
