//
//  NotesData+CoreDataProperties.swift
//  ToDoList
//
//  Created by Sarthak Vashistha on 2022-11-28.
//
//

import Foundation
import CoreData


extension NotesData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotesData> {
        return NSFetchRequest<NotesData>(entityName: "NotesData")
    }

    @NSManaged public var date: Date?
    @NSManaged public var dueDate: String?
    @NSManaged public var hasDueDate: Bool
    @NSManaged public var id: Int32
    @NSManaged public var isCompleted: Bool
    @NSManaged public var name: String?
    @NSManaged public var notes: String?

}

extension NotesData : Identifiable {

}
