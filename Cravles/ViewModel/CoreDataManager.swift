//
//  CoreDataManager.swift
//  Cravles
//
//  Created by Indah Nurindo on 26/11/2564 BE.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistenContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    var viewContext: NSManagedObjectContext{
        return persistenContainer.viewContext
    }
    func getTaskById(id: NSManagedObjectID) -> Reflection? {
        
        do{
            return try viewContext.existingObject(with: id) as? Reflection
        } catch {
            return nil
        }
    }
    func deleteTask(reflection: Reflection) {
        viewContext.delete(reflection)
        save()
    }
    
    func getAllReflection() -> [Reflection] {
        let request: NSFetchRequest<Reflection> = Reflection.fetchRequest()

        do {
           return try viewContext.fetch(request)
        } catch {
            return[]
        }
    }
    
    func save() {
        do{
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    private init() {
        persistenContainer = NSPersistentContainer(name: "Cravles")
        persistenContainer.loadPersistentStores{ (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
                
            }
        }
    }
}
