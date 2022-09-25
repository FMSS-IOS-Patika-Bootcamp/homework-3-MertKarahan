//
//  ThirdItemViewModel.swift
//  myApp
//
//  Created by Mert Karahan on 18.09.2022.
//

import Foundation
import CoreData

class ToDoListViewModel: ToDoListViewModelProtocol {
    
    var items: [ToDoItemModel] = []
    
//    Determine item in item list.
    func itemAtIndex(at index: Int) -> ToDoItemModel {
        return items[index]
    }
//     Determine item list count.
    var numberOfItems: Int {
        return items.count
    }
    
//    For delete choosen item.
    func deleteTask(index: Int) {
        
        guard let indexId = itemAtIndex(at: index).id else {return}
        
        let fetchRequest: NSFetchRequest<ToDoItemEntity> = ToDoItemEntity.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "id == %@", indexId.uuidString)
        
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let result = try context.fetch(fetchRequest)
            
            for result in result {
                context.delete(result)
            }
            
            AppDelegate.sharedAppDelegate.coreDataStack.save()
            
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    func getData() {
        
        let fetchRequest: NSFetchRequest<ToDoItemEntity> = ToDoItemEntity.fetchRequest()
        
        let sortByDate = NSSortDescriptor(key: #keyPath(ToDoItemEntity.dateForSorting), ascending: false)
        
        fetchRequest.sortDescriptors = [sortByDate]
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let result = try context.fetch(fetchRequest)
            
            let filteredList = result.filter { entity in
                return !(entity.title?.isEmpty ?? true)
            }
            
            items = filteredList.map({ entity in
                return ToDoItemModel(title: entity.title,
                                     description: entity.desc,
                                     date: entity.date,
                                     id: entity.id)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
}
