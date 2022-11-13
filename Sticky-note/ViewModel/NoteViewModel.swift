//
//  NoteViewModel.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import Foundation
import Combine

class NoteViewModel {
    var noteType: NoteServiceProtocol
    
    init(noteType: NoteServiceProtocol = NoteService()) {
        self.noteType = noteType
    }
    
    func addNote(folder: Folder, heading:String, body:String){
        let _ = noteType.createNote(folder: folder, heading: heading, body: body)
    }
    
    func deleteNote(note: Note){
        noteType.deleteNote(note: note)
    }
    
    func updateNote(note: Note, heading:String, body:String, lastUpdated:Date){
       let _ = noteType.updateNote(note: note, heading: heading, body: body, lastUpdated: lastUpdated)
       // print("\(updateNote.heading!)\n\(updateNote.body!)\n\(updateNote.lastUpdated!)")
    }
    func starNote(folder: Folder, isStarred: Bool){

    }
}
