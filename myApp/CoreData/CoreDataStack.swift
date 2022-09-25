//
//  CoreDataStack.swift
//  myApp
//
//  Created by Mert Karahan on 23.09.2022.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private let coreDataModel : String
    
    init(coreDataModel: String) {
        self.coreDataModel = coreDataModel
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: coreDataModel)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("ERROR \(error.localizedDescription)")
            }
        }
        return container
    } ()
    
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    
    func save() {
        guard managedContext.hasChanges else { return }
        
        do{
            try managedContext.save()
        } catch let error as NSError {
            print("\(error)")
        }
    }
}
