//
//  MoodCreatorViewViewController.swift
//  MARJ: Path To Happiness
//
//  Created by Michael Murphy on 5/3/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class MoodCreatorViewController: UIViewController, UIScrollViewDelegate {
    
    var myMood: [Mood]!
    
    
    @IBOutlet var positiveLabels: [UILabel]!
    
    @IBOutlet var negativeLabels: [UILabel]!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var moodDescriptionTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for label in positiveLabels {
            label.isEnabled = false
            label.alpha = 0
        }
        for label in negativeLabels {
//            label.isEnabled = false
//            label.alpha = 0
        }
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 800)
        scrollView.isScrollEnabled = true
        scrollView.bounces = false
        
    }
    
    
    
    
    
    @IBAction func positiveMoodButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "positiveSegue", sender: self)
    }
    
    @IBAction func negativeMoodButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "negativeSegue", sender: self)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
