//
//  FolderViewModel.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import Foundation
import Combine

class FolderViewModel {
    
    var folderType : FolderServiceProtocol
    @Published var folders:[Folder] = []
    @Published var notes:[Note] = []
    
    init(folderType : FolderServiceProtocol = FolderService()) {
        self.folderType = folderType
    }
    
    func addFolder(category:String,heading:String,completion: (() -> Void?) ){
        let _ = folderType.createFolder(category: category, heading: heading)
       // print("\(newFolder.heading!)\n\(newFolder.category!)\n\(newFolder.createdAt!)")
    }
    
    func getFolders(){
        let data = folderType.fetchFolders()
        self.folders = data
    }
    
    func getNotes(folder: Folder){
        let data = folderType.fetchNotes(folder: folder)
        self.notes = data
    }
    func deleteFolder(folder:Folder){
        folderType.deleteFolder(folder: folder)
    }
    
    func updateFolder(folder: Folder, heading:String, category:String, lastUpdated:Date){
       let _ = folderType.updateFolder(folder: folder, heading: heading, category: category, lastUpdated: lastUpdated)
       // print("\(updatedFolder.heading!)\n\(updatedFolder.category!)\n\(updatedFolder.lastUpdated!)")
    }
}

