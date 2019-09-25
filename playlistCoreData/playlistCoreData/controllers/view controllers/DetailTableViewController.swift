//
//  DetailTableViewController.swift
//  playlistCoreData
//
//  Created by Matthew O'Connor on 9/25/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    var playlist: Playlist?
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let playlist = playlist,
            let songName = songTitleTextField.text,
            let artistName = artistNameTextField.text
            else { return }
        SongController.createSong(songName: songName, artistName: artistName, to: playlist)
        songTitleTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlist?.songs?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        guard let unwrappedPlaylist = playlist, let song = unwrappedPlaylist.songs?[indexPath.row] as? Song else { return UITableViewCell()}
//        let song = playlist?.songs?[indexPath.row]
        cell.textLabel?.text = song.songName
        cell.detailTextLabel?.text = song.artistName
        return cell
    }


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist,
                let song = playlist.songs?[indexPath.row] as? Song
                else { return }
            SongController.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

}
