//
//  GuidedViewController.swift
//  MARJ: Path To Happiness
//
//  Created by Jansen Rondael on 5/24/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import AVFoundation


class GuidedViewController: UIViewController {
    var player: AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        }
   @IBAction func Right(_ sender: UIButton) {
    
    do
    {
        let audioPath = Bundle.main.path(forResource: "gymn", ofType: "mp3")
        try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
    }
    catch
        
    {
        //ERROR
    }
    player.play()
    
    
    
    
    }
    @IBAction func Mid(_ sender: UIButton) {
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "canon", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
            
        {
            //ERROR
        }
        player.play()
        
    }
    @IBAction func left(_ sender: UIButton) {
        do
        {
            let audioPath = Bundle.main.path(forResource: "noct", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
            
        {
            //ERROR
        }
        
     player.play()
    }
    
    
    
    
}

