//
//  CoreDataStack.swift
//  TheList
//
//  Created by Michael Castillo on 2/17/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TheList")
        container.loadPersistentStores(completionHandler: {(NSPersistentStoreDescription, error) in
            if let error = error {
                fatalError("Error loading persistent stores: \(error)")
            }
        })
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
    
}
