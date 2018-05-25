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
    @IBOutlet weak var moodDescriptionTextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCurrentMood = myMoods.first
        scrollView.isScrollEnabled = true
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1200)
        scrollView.bounces = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var array1: [String] = []
        var NegativeCounter = 0
        for (negativeKey, negativeValue) in myCurrentMood.negativeMoods {
            if negativeValue == true {
                negativeLabels[NegativeCounter].text = negativeKey
                NegativeCounter += 1
            }
        }
        
        for value in NegativeCounter..<negativeLabels.count {
            negativeLabels[value].text = ""
        }
        
        
        var array: [String] = []
        var positiveCounter = 0
        for (positiveKey,positiveValue) in myCurrentMood.PositiveMoods {
            if positiveValue == true {
                positiveLabels[positiveCounter].text = positiveKey
                positiveCounter += 1
            }
        }
        for value in positiveCounter..<positiveLabels.count {
            positiveLabels[value].text = ""
        }
    }

    
    @IBAction func CancelBtnPressed(_ sender: UIBarButtonItem) {

        
    }
    
    
    
    
    @IBAction func positiveMoodButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "positiveSegue", sender: self)
    }
    
    @IBAction func negativeMoodButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "negativeSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "positiveSegue" {
            let positiveView = segue.destination as! PositiveMoodTableView
            positiveView.currentMood = myCurrentMood
        }
        if segue.identifier == "negativeSegue" {
            let negativeView = segue.destination as! NegativeMoodTableView
            negativeView.currentMood = myCurrentMood
        }
  }
}
