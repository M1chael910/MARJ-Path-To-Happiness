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
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    var SelectedMood: Mood!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy h:mm a"
        navigationItem.title = "\(dateFormatter.string(from: SelectedMood.date))"
        descriptionTextView.text = SelectedMood.description
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
}
