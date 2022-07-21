//
//  CoreDataStack.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 04/07/22.
//

import Foundation
import CoreData
import CloudKit

class CoreDataStack {
    private let modelName: String = "Reprodukasi"
    
    private lazy var storeContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: modelName)
        
        let defaultDirectoryURL = NSPersistentContainer.defaultDirectoryURL()
        
        let localStoreLocation = defaultDirectoryURL.appendingPathComponent("cdlocal.sqlite")
        let localStoreDescription = NSPersistentStoreDescription(url: localStoreLocation)
        localStoreDescription.shouldInferMappingModelAutomatically = true
        localStoreDescription.shouldMigrateStoreAutomatically = true
        localStoreDescription.configuration = "Local"
        
        let cloudStoreLocation = defaultDirectoryURL.appendingPathComponent("cdcloud.sqlite")
        let cloudStoreDescription = NSPersistentStoreDescription(url: cloudStoreLocation)
        cloudStoreDescription.shouldInferMappingModelAutomatically = true
        cloudStoreDescription.shouldMigrateStoreAutomatically = true
        cloudStoreDescription.configuration = "Cloud"
        
        cloudStoreDescription.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.com.cleanrun.Reprodukasi")
        cloudStoreDescription.cloudKitContainerOptions?.databaseScope = .public
        
        container.persistentStoreDescriptions = [localStoreDescription, cloudStoreDescription]
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error)", "\(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = {
        let context = storeContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
        return context
    }()
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error)", "\(error.userInfo)")
        }
    }
    
}
