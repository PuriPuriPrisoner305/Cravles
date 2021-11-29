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
        Mood(id: 0, mood: "Sad", moodImg: UIImage(named: "img1")!),
        Mood(id: 1, mood: "Neutral", moodImg: UIImage(named: "img2")!),
        Mood(id: 2, mood: "Happy", moodImg: UIImage(named: "img3")!)
    ]
}
