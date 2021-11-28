//
//  RainCoreData.swift
//  Cravles
//
//  Created by Indah Nurindo on 28/11/2564 BE.
//

import CoreData
import SwiftUI

class RainCoreData: ObservableObject {

    let container: NSPersistentContainer
    @Published var savedEntities: [Reflection] = []

    @Published var reflection1: String?
//    @Published var senId: String?

    init() {
        container = NSPersistentContainer(name: "DeviceIotData")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error Loading Core Data: \(error)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        fetchDeviceIot()
    }

    func fetchDeviceIot() {
        let request = NSFetchRequest<Reflection>(entityName: "Reflection")

        do {
            savedEntities = try container.viewContext.fetch(request)
                for data in savedEntities {
                    self.reflection1 = data.value(forKey: "reflection1") as? String
//                    self.senId = data.value(forKey: "sensorId") as? String
//                    print(data.value(forKey: "userId") as! String)
//                    print(data.value(forKey: "sensorId") as! String)
                }
        } catch let error {
            print("Error fetching: \(error)")
        }

    }

//    func updateDeviceIot(entity: Reflection) {
//        let currentUserId = entity.userId ?? ""
//        let newUserId = currentUserId + "!"
//        entity.userId = newUserId
//        let currentSensorId = entity.sensorId ?? ""
//        let newSensorId = currentSensorId + "!"
//        entity.sensorId = newSensorId
//        saveData()
//    }
//    func getTaskById(id: NSManagedObjectID) -> Reflection? {
//
//        do{
//            return try viewContext.existingObject(with: id) as? Reflection
//        } catch {
//            return nil
//        }
//    }
    
    func deleteDeviceIot(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }

    func addDeviceIot(text: String) {
        let newRain = Reflection(context: container.viewContext)
//        newIoT.userId = text
        newRain.reflection1 = text
        newRain.dayReflection = text
//        newIoT.sensorId = text2
        saveData()
    }

    func saveData() {
        do {
           try container.viewContext.save()
            fetchDeviceIot()
        } catch let error {
            print("Error saving: \(error)")
        }

    }

}
