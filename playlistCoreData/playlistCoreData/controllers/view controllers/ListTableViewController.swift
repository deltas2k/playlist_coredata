//
//  ListTableViewController.swift
//  playlistCoreData
//
//  Created by Matthew O'Connor on 9/25/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    @IBOutlet weak var playlistNameTextField: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        tableView.reloadData()
    }
    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
        guard let name = playlistNameTextField.text else { return }
        playlistController.shared.createPlaylist(withName: name)
        playlistNameTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlistController.shared.playlist.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        let playlist = playlistController.shared.playlist[indexPath.row]
        let songCount = playlist.songs?.count ?? 0
        
        cell.textLabel?.text = playlist.playlistName
        cell.detailTextLabel?.text = "\(songCount)"
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = playlistController.shared.playlist[indexPath.row]
            playlistController.shared.deletePlaylist(playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "segueToDetailVC" {
            guard let indexPathTapped = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? DetailTableViewController else { return }
            let objectToSend = playlistController.shared.playlist[indexPathTapped.row]
            destinationVC.playlist = objectToSend
        }
    }
    

}
