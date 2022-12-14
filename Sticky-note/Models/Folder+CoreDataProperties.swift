//
//  Folder+CoreDataProperties.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import Foundation
import CoreData

extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: "Folder")
    }

    @NSManaged public var category: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var heading: String?
    @NSManaged public var id: UUID?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var notes: NSSet?

    
    static func sortFolderRequest () -> NSFetchRequest<Folder> {
        let request = NSFetchRequest<NSManagedObject>(entityName: "Folder")
        let dateSortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        request.sortDescriptors = [dateSortDescriptor]
        return NSFetchRequest<Folder>(entityName: "Folder")
    }
    public var notesArray: [Note] {
        let set = notes as? Set<Note> ?? []
        return set.sorted()
    }
}

// MARK: Generated accessors for notes
extension Folder {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Note)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Note)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

}

extension Folder : Identifiable {

}

