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
        Mood(id: 0, mood: "ANGRY", moodImg: UIImage(named: "img1")!),
        Mood(id: 1, mood: "ANXIOUS", moodImg: UIImage(named: "img2")!),
        Mood(id: 2, mood: "SAD", moodImg: UIImage(named: "img3")!),
        Mood(id: 3, mood: "TIRED", moodImg: UIImage(named: "img1")!),
        Mood(id: 4, mood: "RELAXED", moodImg: UIImage(named: "img2")!),
        Mood(id: 5, mood: "CONTENT", moodImg: UIImage(named: "img3")!),
        Mood(id: 6, mood: "HAPPY", moodImg: UIImage(named: "img1")!),
        Mood(id: 7, mood: "EXCITED", moodImg: UIImage(named: "img2")!)


//        ["ANGRY","ANXIOUS","SAD","TIRED","RELAXED","CONTENT","HAPPY","EXCITED"]
    ]
}
