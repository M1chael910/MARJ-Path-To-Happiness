//
//  Mood.swift
//  MARJ: Path To Happiness
//
//  Created by Michael Murphy on 4/24/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation

struct Mood {
    var PositiveMoods: [String : Bool]?
    var negativeMoods: [String : Bool]?
    var description: String
    var date: Date
    
    static var positiveMood = ["Excited", "Optimistic", "Calm", "Confident", "Bold", "Happy", "Relaxed", "Peacefull"]
    static var negativeMood = ["Depressed", "HeartBroken", "Upset", "Pesamistic", "Lonely", "Anxious", "Tired", "Guilty"]
    
    
}
