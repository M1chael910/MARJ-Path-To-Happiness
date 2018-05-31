//
//  MainMoodTableViewTableViewController.swift
//  MARJ: Path To Happiness
//
//  Created by Michael Murphy on 4/30/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class MainMoodTableViewController: UITableViewController {
    
    
    var moods: [Mood] = []
    
    override func viewDidAppear(_ animated: Bool) {
        if let object = UserDefaults.standard.data(forKey: "myMoods") {
            if let objectDecoded = try? JSONDecoder().decode([Mood].self, from: object) {
                moods = objectDecoded
                print("moods decoded!!!!")
            }
        } else {
            print("Decoding Failed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        navigationItem.leftBarButtonItem = editButtonItem
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
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     self.moods.remove(at: indexPath.row)
     self.tableView.deleteRows(at: [indexPath], with: .fade)
     self.tableView.reloadData()
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
        }else if
             segue.identifier == "SelectionPage" {
            _ = segue.destination as! GuidedViewController
            

        
    } else {
            let NVC = segue.destination as! SelectedLogViewController
            let currentRow = tableView.indexPathForSelectedRow?.row
            NVC.SelectedMood = moods[currentRow!]
        }
     }

}



