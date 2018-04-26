//
//  Mood.swift
//  MARJ: Path To Happiness
//
//  Created by Michael Murphy on 4/24/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation


enum moodType {
    case happy
    case sad
    case stressed
    case Anxious
}


class Mood {
    var mood: [moodType]
    var description: String
}
