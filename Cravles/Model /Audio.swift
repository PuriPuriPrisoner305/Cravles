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
        Audio(id: 0, title: "Breathing", exerciseDesc: "Focus your attention on your breathing and the way it feels on each inhale and exhale", exerciseDuration: "01:12", artwork: UIImage(systemName: "gear")!, titleAudio: "BreatingExercise", typeAudio: "m4a"),
        Audio(id: 1, title: "Sitting Mindfulness", exerciseDesc: "Sitting mindfulness", exerciseDuration: "12:00", artwork: UIImage(systemName: "leaf")!, titleAudio: "AudioBreathing", typeAudio: "mp3")
    ]
}
