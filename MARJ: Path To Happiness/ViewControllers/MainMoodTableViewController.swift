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
    
    func PlayMusic() {
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
    }
    
    
    func saveData() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("moods").appendingPathExtension("plist")
        let propertyListEncoder = PropertyListEncoder()
        let encodedMoods = try? propertyListEncoder.encode(moods)
        
        try? encodedMoods?.write(to: archiveURL, options: .noFileProtection)
        
        
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedMoodsData = try? Data(contentsOf: archiveURL), let decodedMoods = try? propertyListDecoder.decode(Array<Mood>.self, from: retrievedMoodsData) {
            
        }
        }
        
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PlayMusic()
        saveData()
        self.navigationItem.leftBarButtonItem = editButtonItem
    }

    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
    let NewMood = Mood(description: "", date: Date(timeIntervalSinceNow: TimeInterval(exactly: 1)!))
    moods.append(NewMood)

    self.performSegue(withIdentifier: "mainToCreator", sender: self)
    }
    
    
    
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
    
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return moods.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCellId", for: indexPath) as! mainMoodCell
        if !moods.isEmpty {
            var positiveArray: [Bool] = []
            var negativeArray: [Bool] = []
            let mood = moods[indexPath.row]

            for mood in mood.PositiveMoods {
                if mood.value == true {
                    positiveArray.append(mood.value)
                }
            }
            for mood in mood.negativeMoods {
                if mood.value == true {
                    negativeArray.append(mood.value)
                }
            }
        
            
            cell.positiveMoodLabel.text = "\(positiveArray.count) positive feelings"
            cell.negativeMoodLabel.text = "\(negativeArray.count) negative feelings"
            
            if positiveArray.count > negativeArray.count {
                cell.backgroundColor = .green
            } 
            if negativeArray.count > positiveArray.count {
                cell.backgroundColor = .red
            }
            if negativeArray.count == positiveArray.count {
                cell.backgroundColor = .cyan
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            cell.dateLabel.text = "\(dateFormatter.string(from: mood.date))"
            return cell
            }
        
        return UITableViewCell()
        
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
     moods.remove(at: indexPath.row)
     } else if editingStyle == .insert {
   
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




