//
//  List Controller.swift
//  TheList
//
//  Created by Michael Castillo on 2/17/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import Foundation
import CoreData

class ListController {

    static let shared = ListController()
    
    let moc = CoreDataStack.context

    var item: [List]{
        let _ = CoreDataStack.context
        let request: NSFetchRequest<List> = List.fetchRequest()
        
        return ( try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    func saveToPersistentStore() {
        do {
            try moc.save()
        } catch {
            NSLog("There was a problem saving")
        }
    }
    
    func create(item: String) {
        let _ = List(didPurchase: false, item: item)
        saveToPersistentStore()
    }
    
    func delete(item: List) {
        moc.delete(item)
        saveToPersistentStore()
    }
 
    func buttonIsToggledForPurchase(item: List){
        item.didPurchase = !item.didPurchase
        saveToPersistentStore()
    }
}
