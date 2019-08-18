//
//  CoreDataManager.swift
//  GetItDone
//
//  Created by George Shafik on 3/8/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import CoreData

// Setting up Core Data Manager as a Singleton Object
struct CoreDataManager {
  
  // Is an object, that get created once and we have access through out our application
  static let shared = CoreDataManager() // this variable is static and is a Single instance of our CoreDataManager
  
  // Write out our persistant containter to get access to our view context
  let persistenContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "GetItDone")
    
    // Load persistant store
    container.loadPersistentStores { (storeDescription, err) in
      if let err = err {
        fatalError("loading of store failed: \(err)")
      }
    }
    
    return container
    
  }()
  
  func creteToDo(id:Double, title:String, status:Bool) {
    
    // when we run this we are going to get a view context from our persistant containe
    let context = persistenContainer.viewContext
    
    // create a toDo object and inserted into our comtainer for entity toDo
    let toDo = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: context)
    
    
    toDo.setValue(id, forKey: "id")
    toDo.setValue(title, forKey: "title")
    toDo.setValue(status, forKey: "status")
    
    do {
      try context.save()
    } catch let err {
      print("failed to save context with new toDo:", err)
    }
  }
  
  func fetchToDos() -> [ToDo] {
    let context = persistenContainer.viewContext
    
    let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")
    
    do {
      let toDos =  try context.fetch(fetchRequest)      
      return toDos
    } catch let err {
      print("failed to save context with new toDo:", err)
      return [] // its failed return empty array
    }
    
  }
  
  
  
}
