//
//  Mood.swift
//  MARJ: Path To Happiness
//
//  Created by Michael Murphy on 4/24/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation

class Mood: Codable {
    var PositiveMoods: [String : Bool] = ["Excited" : false, "Optimistic" : false, "Calm" : false, "Confident" : false, "Bold" : false, "Happy" : false, "Relaxed" : false, "Peaceful": false]
    var negativeMoods: [String : Bool] = ["Depressed" : false, "Heartbroken": false , "Upset": false, "Pesamistic": false, "Lonely": false, "Anxious": false, "Tired": false, "Guilty": false]
    var description: String
    var date: Date
 
    init(description:String, date: Date) {
        self.description = description
        self.date = date
    }
    
    
    enum CodingKey1: [String:Bool], CodingKey {

        case positiveMoods
        case negativeMoods

    }
    
    
    
}

