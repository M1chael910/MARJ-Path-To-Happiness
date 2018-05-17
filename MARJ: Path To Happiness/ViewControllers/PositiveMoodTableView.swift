//
//  PositiveMoodTableView.swift
//  MARJ: Path To Happiness
//
//  Created by Michael Murphy on 5/3/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class PositiveMoodTableView: UITableViewController {
    
    var positiveMoods: [String : Bool]!
    var currentMood: Mood!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        positiveMoods = currentMood.PositiveMoods
        tableView.delegate = self
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return positiveMoods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PositiveMoods", for: indexPath)
        cell.textLabel?.text = Array(positiveMoods.keys)[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let Index = tableView.indexPathForSelectedRow {
            if let currentCell = tableView.cellForRow(at: Index) {
                currentCell.accessoryType = .checkmark
                currentMood.PositiveMoods[(currentCell.textLabel?.text)!] = true
           }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return false
    }
 

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 

}
