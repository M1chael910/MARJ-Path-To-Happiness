//
//  MoodCreatorViewViewController.swift
//  MARJ: Path To Happiness
//
//  Created by Michael Murphy on 5/3/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class MoodCreatorViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
        scrollView.isScrollEnabled = true
        scrollView.bounces = false
        
        
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
