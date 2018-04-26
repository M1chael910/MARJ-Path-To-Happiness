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
    
}


enum negativeMood {
    case depressed
    case heartBroken
    case upset
    case pesamistic
    case lonely
    case anxious
    case tired
}




struct Mood {
    var happyMoods: [positiveMood]?
    var negativeMoods: [negativeMood]?
    
}
