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
    
    
    enum CodingKeys: CodingKey {
        case positiveMoods
        case negativeMoods
        case description
        case date
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        PositiveMoods = try container.decode(Dictionary.self, forKey: CodingKeys.positiveMoods)
        negativeMoods = try container.decode(Dictionary.self, forKey: CodingKeys.negativeMoods)
        description = try container.decode(String.self, forKey: CodingKeys.description)
        date = try container.decode(Date.self, forKey: CodingKeys.date)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(PositiveMoods, forKey: CodingKeys.positiveMoods)
        try container.encode(negativeMoods, forKey: CodingKeys.negativeMoods)
        try container.encode(date, forKey: CodingKeys.date)
        try container.encode(description, forKey: CodingKeys.description)
    }
    
    
    
}

