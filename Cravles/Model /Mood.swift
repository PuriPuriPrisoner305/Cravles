//
//  Mood.swift
//  Cravles
//
//  Created by Yani . on 26/11/21.
//

import SwiftUI

struct Mood : Hashable, Identifiable {
    let id: Int
    let mood : String
    let moodImg : UIImage

    static let moods : [Mood] = [
        Mood(id: 0, mood: "ANGRY", moodImg: UIImage(named: "angry")!),
        Mood(id: 1, mood: "ANXIOUS", moodImg: UIImage(named: "anxious")!),
        Mood(id: 2, mood: "SAD", moodImg: UIImage(named: "sad")!),
        Mood(id: 3, mood: "TIRED", moodImg: UIImage(named: "tired")!),
        Mood(id: 4, mood: "RELAXED", moodImg: UIImage(named: "relaxed")!),
        Mood(id: 5, mood: "CONTENT", moodImg: UIImage(named: "content")!),
        Mood(id: 6, mood: "HAPPY", moodImg: UIImage(named: "happy")!),
        Mood(id: 7, mood: "EXCITED", moodImg: UIImage(named: "excited")!)


//        ["ANGRY","ANXIOUS","SAD","TIRED","RELAXED","CONTENT","HAPPY","EXCITED"]
    ]
}
