//
//  CoreDataStack.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 04/07/22.
//

import Foundation
import CoreData

class CoreDataStack {
    private let modelName: String = "Reprodukasi"
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error)", "\(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = storeContainer.viewContext
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error)", "\(error.userInfo)")
        }
    }
    
}
