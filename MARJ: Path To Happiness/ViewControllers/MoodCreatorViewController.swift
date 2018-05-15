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
    
    
    var myCurrentMood: Mood!
    
    
    @IBOutlet var positiveLabels: [UILabel]!
    
    @IBOutlet var negativeLabels: [UILabel]!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var moodDescriptionTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCurrentMood = myMoods.last
        
        
        scrollView.isScrollEnabled = true
        for label in positiveLabels {
            label.textAlignment = .center
            label.isEnabled = true
            label.text = ""
            label.alpha = 1
        }
        for label in negativeLabels {
            label.textAlignment = .center
            label.text = ""
            label.isEnabled = true
            label.alpha = 1
        }
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 800)
        
        scrollView.bounces = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var array: [String] = []
        var counter = 0
        for (key,value) in myCurrentMood.PositiveMoods {
            if value == true {
                positiveLabels[counter].text = key
                counter += 1
            }
        }
        
        for value in counter..<positiveLabels.count {
            positiveLabels[value].text = ""
        }
        
        
        
        var array1: [String] = []
        var counter1 = 0
        for (key,value) in myCurrentMood.negativeMoods {
            if value == true {
                negativeLabels[counter1].text = key
                counter1 += 1
            }
        }
        
        for value in counter1..<negativeLabels.count {
            negativeLabels[value].text = ""
        }
    }
    
    
    
    @IBAction func positiveMoodButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "positiveSegue", sender: self)
    }
    
    @IBAction func negativeMoodButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "negativeSegue", sender: self)
    }

    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "positiveSegue"{
            let positiveView = segue.destination as! PositiveMoodTableView
            positiveView.currentMood = myCurrentMood
        }
        
        
        if segue.identifier == "negativeSegue" {
            let negativeView = segue.destination as! NegativeMoodTableView
            negativeView.currentMood = myCurrentMood
        }
        
        if segue.identifier == "saveMoodSegue" {
            let mainMoodView = segue.destination as! MainMoodTableViewController
             mainMoodView.moods.append(myCurrentMood)
        }
        
    }
    
    

 

}
