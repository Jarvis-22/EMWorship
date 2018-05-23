//
//  TableViewController.swift
//  EMWorship
//
//  Created by Jarvis Flores on 5/12/18.
//  Copyright © 2018 Jarvis Flores. All rights reserved.
//

import UIKit
var songs: [String] = []
var texter: [String] = []
var myIndex = 0
class TableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let t = "praise"
        //print(t)
        do {
            
            if let path = Bundle.main.path(forResource: "\(t)", ofType: "txt")
            {
                let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                songs = data.components(separatedBy: "\n")
            }
            } catch let error as NSError {
            // do something with Error
                print(error)
            }
            return (songs.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = songs[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

}
