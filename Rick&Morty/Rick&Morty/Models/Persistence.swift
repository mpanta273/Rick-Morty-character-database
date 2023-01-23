//
//  Persistence.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/13/22.
//

import Foundation
import CoreData


class Persistence: ObservableObject {
    
    let container = NSPersistentContainer(name: "CharacterHub")
    
    init() {
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved Core Data error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
