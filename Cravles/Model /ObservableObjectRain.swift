//
//  ObservableObjectRain.swift
//  Cravles
//
//  Created by Indah Nurindo on 01/12/2564 BE.
//

import Foundation
import CoreData
import Combine

struct RainModel{
    var id : NSManagedObjectID = NSManagedObjectID()
    var dateReflection : Date = Date()
    var quotes : String = ""
    var reflection1 : String = ""
    var reflection2 :String = ""
    var reflection3 : String = ""
}
struct Rain1{
    var feeling : String = ""
}

class ObservableObjectRain: ObservableObject {
    @Published var dateRain: Date = Date()
    @Published var feelingRain: String = ""
    @Published var reflectionRain1: String = ""
    @Published var reflectionRain2: String = ""
    @Published var reflectionRain3: String = ""
        
    @Published var data : [RainModel] = [RainModel]()
    @Published var currentData = RainModel()
    static let shared = ObservableObjectRain()
    init() {
        read()
    }
    
    func read(){
        let persistent  = PersistenceController.shared
        let context  = persistent.container.viewContext
        let fetchreq = NSFetchRequest<NSFetchRequestResult>(entityName: "Reflection")
        
        data = []
        do{
            let results = try context.fetch(fetchreq)
            
            if !results.isEmpty{
                for res in results as! [NSManagedObject]{
                    let id = res.objectID
                    let date = res.value(forKey: "dateReflection") as! Date 
                    let quotes = res.value(forKey: "quotes") as! String
                    let ref1 = res.value(forKey: "reflection1") as! String
                    let ref2 = res.value(forKey: "reflection2") as! String
                    let ref3 = res.value(forKey: "reflection3") as! String
                    let d = RainModel(id: id, dateReflection: date, quotes: quotes, reflection1: ref1, reflection2: ref2, reflection3: ref3)
                    data.append(d)
                    print("\(ref1)")
                }
            }
            
        }catch{
            
        }
    }
    func checkProgress() {
        
    }
    
    func save(rain:RainModel){
        let persistent  = PersistenceController.shared
        let context  = persistent.container.viewContext
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Reflection", into: context)
        entity.setValue(rain.quotes, forKey: "quotes")
        entity.setValue(rain.dateReflection, forKey: "dateReflection")
        entity.setValue(rain.reflection1, forKey: "reflection1")
        entity.setValue(rain.reflection2, forKey: "reflection2")
        entity.setValue(rain.reflection3, forKey: "reflection3")
        do {
            try? context.save()
            if context.hasChanges{
                ObservableObjectRain.shared.updateReflection1(feeling: "TIRED", rain: rain)
            }
        } catch {
            print("Error")
        }
        read()
        
    }
    
    func update(id:NSManagedObjectID,key:String,value:String, reflection1: Rain1){
        let persistent  = PersistenceController.shared
        let context  = persistent.container.viewContext
        do{
            let obj = try context.existingObject(with: id)
            obj.setValue(value, forKey: key)
        }catch{
            
        }
    }
    func updateReflection1(feeling: String, rain: RainModel){
        let persistent  = PersistenceController.shared
        let context  = persistent.container.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Reflection1", into: context)
        entity.setValue(feeling, forKey: "feeling")
        do {
            try? context.save()
        } catch {
            print("error")
        }
    }
    func delete(id:NSManagedObjectID){
        let persistent  = PersistenceController.shared
        let context  = persistent.container.viewContext
        do{
            let obj = try context.existingObject(with: id)
            context.delete(obj)
        }catch{
            
        }
    }
    var isKosong: Bool {
        
        if reflectionRain1.isEmpty {
            return true
        } else {
            return false
        }
    }
}
