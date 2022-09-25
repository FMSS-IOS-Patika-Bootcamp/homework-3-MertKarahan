//
//  DetailViewModel.swift
//  myApp
//
//  Created by Mert Karahan on 22.09.2022.
//

import Foundation


class AddToDoViewModel: DetailViewModelProtocol {
    
//    For save new task.
    func saveData(toDoItemModel: ToDoItemModel) {
        
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let data = ToDoItemEntity(context: managedContext)
        
        if let title = toDoItemModel.title {
            data.setValue(title, forKey: #keyPath(ToDoItemEntity.title))
        }
        
        if let description = toDoItemModel.description {
            data.setValue(description, forKey: #keyPath(ToDoItemEntity.desc))
        }
        
        if let date = toDoItemModel.date {
            data.setValue(date, forKey: #keyPath(ToDoItemEntity.date))
        }
        
        data.setValue(Date(), forKey: #keyPath(ToDoItemEntity.dateForSorting))
        
        data.setValue(UUID(), forKey: #keyPath(ToDoItemEntity.id))
        
        AppDelegate.sharedAppDelegate.coreDataStack.save()
        
        print("Saved Successful")
        
    }
}
