//
//  List + Convenience.swift
//  TheList
//
//  Created by Michael Castillo on 2/17/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import Foundation
import CoreData

extension List {

    @discardableResult convenience init (didPurchase: Bool, item: String, context: NSManagedObjectContext = CoreDataStack.context) {
    
        self.init(context: context)
        
        self.didPurchase = didPurchase
        self.item = item
    }
}
