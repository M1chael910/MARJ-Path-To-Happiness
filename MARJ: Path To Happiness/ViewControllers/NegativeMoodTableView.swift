//
//  NegativeMoodTableView.swift
//  MARJ: Path To Happiness
//
//  Created by Michael Murphy on 5/3/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class NegativeMoodTableView: UITableViewController {
    var currentMood: Mood!
    
    var negativeMoods: [String : Bool]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        negativeMoods = currentMood.negativeMoods
        tableView.allowsSelection = true
        tableView.delegate = self
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return negativeMoods.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NegativeMoods", for: indexPath)
        
        for mood in negativeMoods.keys {
            cell.textLabel?.text = mood
        }
   
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var tapIndex = 0
        if let Index = tableView.indexPathForSelectedRow {
            if let currentCell = tableView.cellForRow(at: Index) {
                if currentCell.accessoryType == .checkmark {
                    currentCell.accessoryType = .none
                }
                currentCell.accessoryType = .checkmark
                
            }
        
    }
}
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }




    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}



