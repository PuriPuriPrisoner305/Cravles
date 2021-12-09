//
//  Audio.swift
//  Cravles
//
//  Created by Yani . on 24/11/21.
//

/* --------------INI CONTOH PROJECT------------- */

import SwiftUI

struct Audio : Identifiable, Hashable {
    var id : Int
    var title : String
    var exerciseDesc : String
    var exerciseDuration : String
    var artwork : UIImage
    var titleAudio : String
    var typeAudio : String

    static let audios: [Audio] = [
        Audio(id: 0, title: "Breathing", exerciseDesc: "Focus your attention on your breathing and the way it feels on each inhale and exhale", exerciseDuration: "01:12", artwork: UIImage(named: "Breathing")!, titleAudio: "BreatingExercise", typeAudio: "m4a"),
        Audio(id: 1, title: "Sitting Mindfulness", exerciseDesc: "Sitting in a relaxed but erect posture and cultivating awareness each breath you take", exerciseDuration: "12:00", artwork: UIImage(named: "Sitting")!, titleAudio: "AudioBreathing", typeAudio: "mp3")
    ]
}
