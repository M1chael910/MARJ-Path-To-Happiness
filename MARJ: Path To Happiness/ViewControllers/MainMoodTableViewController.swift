//
//  MainMoodTableViewTableViewController.swift
//  MARJ: Path To Happiness
//
//  Created by Michael Murphy on 4/30/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import AVFoundation

class MainMoodTableViewController: UITableViewController {
    var player: AVAudioPlayer = AVAudioPlayer()
    
    var moods: [Mood] = []

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let mood = Mood(description: "Test", date: Date(timeIntervalSinceNow: TimeInterval(exactly: 0)!))
//        moods.append(mood)
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "canon", ofType: "mp3")
            try player = AVAudioPlayer (contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
            
        {
            //ERROR
        }
        self.player.play()
        
        
        // self.clearsSelectionOnViewWillAppear = false
        
        
        self.navigationItem.leftBarButtonItem = editButtonItem
    }

    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
    let createdMood = Mood(description: "", date: Date(timeIntervalSinceNow: TimeInterval(exactly: 1)!))
        
        
        
    self.performSegue(withIdentifier: "mainToCreator", sender: self)
    }
    
    
    
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCellId", for: indexPath) as! mainMoodCell
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
 
    
    
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
 
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
     }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToCreator" {
            let newView = segue.destination as! MoodCreatorViewController
            newView.myMoods = moods           
        }
        
        
        
        
     }
 
    
}
