////
////  ReflectionViewModel.swift
////  Cravles
////
////  Created by Indah Nurindo on 26/11/2564 BE.
////
//
//import Foundation
//import CoreData
//
//
//class ReflectionViewModel: ObservableObject {
//    let container: NSPersistentContainer
//    var rain1: String = ""
//    var rain2: String = ""
//    var rain3: String = ""
//    @Published var dayReflection: String?
//    @Published var reflection2: String?
//    init() {
//        container = NSPersistentContainer(name: "Cravles")
//        container.loadPersistentStores { (description, error) in
//            if let error = error {
//                print("Error Loading Core Data: \(error)")
//            } else {
//                print("Successfully loaded core data!")
//            }
//        }
//        fetchDataRain()
//
////    @Published var savedEntities: [Reflection] = []
////    var feelingRain: String = ""
//   @Published var reflections: [ReflectionsViewModel] = []
////    var createdRefletion: Date
//    func fetchDataRain() {
//        let request = NSFetchRequest<Reflection>(entityName: "Reflection")
//
//        do {
//            savedEntities = try container.viewContext.fetch(request)
//                for data in savedEntities {
//                    self.dayReflection = data.value(forKey: "dayReflection") as? String
//                    self.reflection2 = data.value(forKey: "reflection2") as? String
//
//                }
//        } catch let error {
//            print("Error fetching: \(error)")
//        }
//    }
//    func getAllReflection () {
//        reflections = CoreDataManager.shared.getAllReflection().map(ReflectionsViewModel.init)
//    }
//    func delete(_ reflection: ReflectionsViewModel){
//
//        let existingReflection = CoreDataManager.shared.getTaskById(id: reflection.id)
//        if let existingReflection = existingReflection {
//            CoreDataManager.shared.deleteTask(reflection: existingReflection)
//        }
//    }
//
////    func updateReflection(entity: ReflectionsViewModel) {
////        let currrentRain1 = entity.rain1 ?? ""
////        let newRain1 = currrentRain1 + "!"
////        self.entity.rain1 = newRain1
////
////
////    }
////
//    func save() {
//
//        let reflection = Reflection(context: CoreDataManager.shared.persistenContainer.viewContext)
//        reflection.reflection1 = rain1
//        reflection.reflection2 = rain2
//        reflection.reflection3 = rain3
////        reflection.feelingBefore = feelingRain
////        reflection.dateReflection = createdRefletion
//
//        CoreDataManager.shared.save()
//
//    }
//
//}
//
//struct ReflectionsViewModel {
//    var reflection: Reflection
//    var id: NSManagedObjectID {
//        return reflection.objectID
//    }
//
//    var rain1: String {
//        return reflection.reflection1 ?? ""
//
//    }
//    var rain2: String {
//        return reflection.reflection2 ?? ""
//
//    }
//    var rain3: String {
//        return reflection.reflection3 ?? ""
//
//    }
////    var feeling: String {
////        return reflection.feelingBefore ?? ""
////
////    }
//}
