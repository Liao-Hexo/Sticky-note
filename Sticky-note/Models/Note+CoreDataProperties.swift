//
//  Note+CoreDataProperties.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import Foundation
import CoreData

extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var body: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var heading: String?
    @NSManaged public var id: UUID?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var folder: Folder?

}

extension Note : Identifiable {

}
