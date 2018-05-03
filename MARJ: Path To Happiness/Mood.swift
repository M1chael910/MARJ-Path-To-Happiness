//
//  Mood.swift
//  MARJ: Path To Happiness
//
//  Created by Michael Murphy on 4/24/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation


enum positiveMood {
    case Excited
    case optimistic
    case calm
    case confident
    case Bold
    case happy
    case relaxed
    case Peaceful
}


enum negativeMood {
    case Depressed
    case HeartBroken
    case Upset
    case Pesamistic
    case Lonely
    case Anxious
    case Tired
    case Guilty
}




struct Mood {
    var PositiveMoods: [positiveMood : Bool]?
    var negativeMoods: [negativeMood : Bool]?
    var description: String
    var date: Date
    
    
}
