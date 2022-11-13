//
//  Note+CoreDataClass.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject, Comparable {
    public static func < (lhs: Note, rhs: Note) -> Bool {
        if lhs.createdAt! < rhs.createdAt! {
            return true
        }
        return false
    }
}
