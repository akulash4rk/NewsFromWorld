//
//  CoreDataManager.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 16.06.2024.
//

import Foundation
import CoreData

class CoreDataManager {
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NewsFromWorld")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("error: \(error)")
            } else {
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: - CRUD
    
    lazy var context = persistentContainer.viewContext
    
    func createData(currentNews : Result) -> News{
        
        let newNews = News(context: context)
        newNews.author = currentNews.creator?[0]
        newNews.title = currentNews.title
        newNews.data = currentNews.pubDate
        newNews.imageUrl = currentNews.imageURL
        newNews.isRead = ((currentNews.isRead) != nil)
        newNews.news = currentNews.description
        newNews.country = currentNews.country?[0]
        newNews.url = currentNews.link
        
        do {
            try context.save()
        } catch let error {
            print(error)
        }
        
        return newNews
        
    }
    
    func readData() -> [News] {
        
        let fetchRequest = NSFetchRequest<News>(entityName: "News")
        do {
            let news = try context.fetch(fetchRequest)
            return news
        } catch {
            print("Error readData")
        }
        return []
    }
    
    func removeAllData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = News.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("Error removeAllData: \(error)")
        }
    }
    
    
    //savedCountry
    
    func createCountry(pickedCountry : CountryList){
        
        let newContry = SavedCountry(context: context)
        newContry.countryCode = pickedCountry.countryCode
        newContry.countryName = pickedCountry.countryName
        
        do {
            try context.save()
        } catch let error {
            print(error)
        }
    }
    
    func readCountry() -> [SavedCountry]{
        
        let fetchRequest = NSFetchRequest<SavedCountry>(entityName: "SavedCountry")
        
        do {
            let news = try context.fetch(fetchRequest)
            return news
        } catch {
            print("Error readCountry")
        }
        return []
    }
    
    func removeAllCountry() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = SavedCountry.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("Error removeAllData: \(error)")
        }
    }
}
    
