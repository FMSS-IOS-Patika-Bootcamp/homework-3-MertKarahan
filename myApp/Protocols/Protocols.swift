//
//  Protocols.swift
//  myApp
//
//  Created by Mert Karahan on 22.09.2022.
//

import Foundation

protocol PostViewModelDelegate: AnyObject {
    
    func reloadData()
}

protocol PhotosViewModelDelegate: AnyObject {
    
    func reloadData()
}

protocol DetailViewModelProtocol {
    func saveData(toDoItemModel: ToDoItemModel)
}

protocol ToDoListViewModelProtocol {
    
    func getData()
    func itemAtIndex(at index: Int) -> ToDoItemModel
    func deleteTask(index: Int)
    var numberOfItems : Int {get}
}
