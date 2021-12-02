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
        Mood(id: 0, mood: "ANGRY", moodImg: UIImage(named: "Angry")!),
        Mood(id: 1, mood: "ANXIOUS", moodImg: UIImage(named: "Anxious")!),
        Mood(id: 2, mood: "SAD", moodImg: UIImage(named: "Sad")!),
        Mood(id: 3, mood: "TIRED", moodImg: UIImage(named: "Tired")!),
        Mood(id: 4, mood: "RELAXED", moodImg: UIImage(named: "Relaxed")!),
        Mood(id: 5, mood: "CONTENT", moodImg: UIImage(named: "Content")!),
        Mood(id: 6, mood: "HAPPY", moodImg: UIImage(named: "Happy")!),
        Mood(id: 7, mood: "EXCITED", moodImg: UIImage(named: "Excited")!)


//        ["ANGRY","ANXIOUS","SAD","TIRED","RELAXED","CONTENT","HAPPY","EXCITED"]
    ]
}
