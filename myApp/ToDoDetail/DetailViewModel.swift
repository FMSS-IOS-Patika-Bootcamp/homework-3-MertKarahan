//
//  DetailViewModel.swift
//  myApp
//
//  Created by Mert Karahan on 24.09.2022.
//

import Foundation



class DetailViewModel {
    
    var toDoItem : ToDoItemModel

    init(model: ToDoItemModel){
        self.toDoItem = model
    }
    
//    For get list element which is title.
    var title: String {
        return toDoItem.title ?? ""
    }
    
//    For get list element which is description.
    var description : String {
        return toDoItem.description ?? ""
    }
    
//    For get list element which is date.
    var date: String {
        return toDoItem.date ?? ""
    }
    
}
