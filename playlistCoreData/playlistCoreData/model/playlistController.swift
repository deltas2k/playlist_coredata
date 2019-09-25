//
//  playlistController.swift
//  playlistCoreData
//
//  Created by Matthew O'Connor on 9/25/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import Foundation

class playlistController {
    //create
    func createPlaylist(withName name: String){
        
    }
    
    //delete
    func deletePlaylist(playlist: Playlist) {
        
    }
    
    //save
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    
}
