//
//  CoreDataManager.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(modelName: "MyApp")
    
    let persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func loadStore(completion: (() -> Void? )){
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("Unresolved error \(error.localizedDescription)")
            }
        }
        completion()
    }
}

