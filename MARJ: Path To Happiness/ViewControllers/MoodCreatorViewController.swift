//
//  MoodCreatorViewViewController.swift
//  MARJ: Path To Happiness
//
//  Created by Michael Murphy on 5/3/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class MoodCreatorViewController: UIViewController, UIScrollViewDelegate {
    
    var myMoods: [Mood]!
    
    
    var myMood: Mood!
    
    
    @IBOutlet var positiveLabels: [UILabel]!
    
    @IBOutlet var negativeLabels: [UILabel]!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var moodDescriptionTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isScrollEnabled = true
        for label in positiveLabels {
            label.isEnabled = true
            label.text = "hi"
            label.alpha = 1
        }
        for label in negativeLabels {
            label.text = "hi"
            label.isEnabled = true
            label.alpha = 1
        }
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 800)
        
        scrollView.bounces = true
        
    }
    
    
    
    
    
    @IBAction func positiveMoodButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "positiveSegue", sender: self)
    }
    
    @IBAction func negativeMoodButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "negativeSegue", sender: self)
    }

    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "positiveSegue"{
            let nvc = segue.destination as? PositiveMoodTableView
            nvc?.positiveMoods = myMood.PositiveMoods
        }
    
    }
 

}
