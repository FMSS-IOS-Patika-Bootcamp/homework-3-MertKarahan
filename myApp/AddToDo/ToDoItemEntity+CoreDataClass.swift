//
//  ToDoItemEntity+CoreDataClass.swift
//  
//
//  Created by Mert Karahan on 23.09.2022.
//
//

import Foundation
import CoreData

@objc(ToDoItemEntity)
public class ToDoItemEntity: NSManagedObject {

}

extension ToDoItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoItemEntity> {
        return NSFetchRequest<ToDoItemEntity>(entityName: "ToDoItemEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var date: String?
    @NSManaged public var dateForSorting: Date?
    @NSManaged public var id: UUID?

}
