//
//  Playlist+Convenience.swift
//  playlistCoreData
//
//  Created by Matthew O'Connor on 9/25/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {
    
    convenience init(playlistName: String, songs: [Song] = [], moc: NSManagedObjectContext =  CoreDataStack.context) {
        self.init(context: moc)
        self.playlistName = playlistName
    }
}
