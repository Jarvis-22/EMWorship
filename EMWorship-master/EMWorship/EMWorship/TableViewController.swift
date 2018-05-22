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
var searched = 0
var s = ""
var t = ""


class TableViewController: UITableViewController, UISearchResultsUpdating {

   
    
    var filteredSongs = [String]()
    var searchController: UISearchController!
    var resultsController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredSongs = songs
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
    
    func readfile(){
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
    
    }
    
    func updateSearchResults(for searchController: UISearchController) {
       
        filteredSongs = songs.filter {(song: String) -> Bool in
            if song.lowercased().contains(self.searchController.searchBar.text!.lowercased())
            {
                return true
            }
            else
            {
                //filteredSongs = songs
                return false
            }
            
        }
        self.resultsController.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        readfile()
        
        
        if tableView == self.tableView {
            return songs.count
        } else {
            return self.filteredSongs.count
        }
        
        
           // return (songs.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell()
       // let t = songs[indexPath.row]
        
        if tableView === self.tableView {
            cell.textLabel?.text = songs[indexPath.row]
            myIndex = indexPath.row
            //s = songs[indexPath.row]
            //print("self=", s)
        }
        else {
            cell.textLabel?.text = self.filteredSongs[indexPath.row]
            //s = songs[indexPath.row]
            //print(s)
        }
        //cell.textLabel?.text = t

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        //self.tableView.deselectRow(at: indexPath, animated: true)
        
        myIndex = indexPath.row
        //let indexPath = tableView.indexPath(for: indexPath.row)
        //tableView.deselectRow(at: indexPath, animated: true)

        if tableView === self.tableView {
           s = songs[indexPath.row]
        } else {
           s = filteredSongs[indexPath.row]
        }
        

//        let indexPath = tableView.indexPathForSelectedRow
//        let selectedObject = filteredSongs[(indexPath?.row)!]
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    

}
