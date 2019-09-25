//
//  songController.swift
//  playlistCoreData
//
//  Created by Matthew O'Connor on 9/25/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    //create
    static func createSong(songName: String, artistName: String, to playlist: Playlist) {
        Song(songName: songName, artistName: artistName, playlist: playlist)
        playlistController.shared.saveToPersistentStore()
    }
    
    //delete
    static func deleteSong(song: Song) {
        CoreDataStack.context.delete(song)
        playlistController.shared.saveToPersistentStore()
    }
    
}
