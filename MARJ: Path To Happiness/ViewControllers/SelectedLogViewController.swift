//
//  SelectedLogViewController.swift
//  MARJ: Path To Happiness
//
//  Created by Paul Jacks on 5/23/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class SelectedLogViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    var SelectedMood: Mood!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        navigationItem.title = "\(dateFormatter.string(from: SelectedMood.date))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
}
