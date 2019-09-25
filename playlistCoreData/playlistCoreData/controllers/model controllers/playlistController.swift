//
//  playlistController.swift
//  playlistCoreData
//
//  Created by Matthew O'Connor on 9/25/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import Foundation
import CoreData

class playlistController {
    
    //singleton
    static let shared = playlistController()
    
    //local SOT
    var playlist: [Playlist] {
            let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
            return(try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    //create
    func createPlaylist(withName name: String){
        let playlist = Playlist(playlistName: name)
        saveToPersistentStore()
    }
    
    //delete
    func deletePlaylist(playlist: Playlist) {
        CoreDataStack.context.delete(playlist)
        saveToPersistentStore()
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
