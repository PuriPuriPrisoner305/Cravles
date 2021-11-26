//
//  SimulationExerciseVM.swift
//  Cravles
//
//  Created by Yani . on 23/11/21.
//

/* --------------INI CONTOH PROJECT------------- */

import SwiftUI
import AVFoundation

let url = URL(fileURLWithPath: Bundle.main.path(forResource: "ambient", ofType: "m4a")!)

class ExerciseVM: ObservableObject {

    @Published var voicePlayer = try! AVAudioPlayer(contentsOf: url)

    @Published var isPlaying = false

    @Published var voice = Audio()

    @Published var angle : Double = 0

    @Published var volume: CGFloat = 0

    func fetchVoice() {

        let fetchasset = AVAsset(url: voicePlayer.url!)

//        asset.metadata.forEach { meta in
//            switch(meta.commonKey?.rawValue) {
//            case "title": voice.title = meta.value as? String ?? ""
//            case "artist": voice.artist = meta.value as? String ?? ""
//            case "type": voice.type = meta.value as? String ?? ""
//            case "artwork": if meta.value != nil{voice.artwork = UIImage(data: meta.value as! Data)!}
//
//            default: ()
//            }
//        }

        //fetching audio volume level
        volume = CGFloat(voicePlayer.volume) * (UIScreen.main.bounds.width - 180)
    }

    func updateTimer() {
        let currentTime = voicePlayer.currentTime
        let total = voicePlayer.duration
        let progress = currentTime / total

        withAnimation(Animation.linear(duration: 0.1)) {
            self.angle = Double(progress) * 288
        }
        isPlaying = voicePlayer.isPlaying
    }

    func onChanged(value: DragGesture.Value) {
        let vector = CGVector(dx: value.location.x, dy: value.location.y)

        //12.5 = 25 ==> Circle Radius
        let radians = atan2(vector.dy - 12.5,  vector.dx - 12.5)
        let tempAngle = radians * 180 / .pi

        let angle = tempAngle < 0 ? 360 + tempAngle : tempAngle

        //Since maximum slide is 0.8
        //0.8 * 360 = 288

        if angle <= 288 {

            //getting time
            let progress = angle / 288
            let time = TimeInterval(progress) * voicePlayer.duration
            voicePlayer.currentTime = time
            voicePlayer.play()

            withAnimation(Animation.linear(duration: 0.1)){ self.angle = Double(angle)}
        }
    }

    func play() {

        if voicePlayer.isPlaying{voicePlayer.pause()}
        else{voicePlayer.play()}
        isPlaying = voicePlayer.isPlaying
    }

    func getCurrentTime(value: TimeInterval) -> String {

        return "\(Int(value / 60)):\(Int(value.truncatingRemainder(dividingBy: 60)) < 10 ? "0" : "")\(Int(value.truncatingRemainder(dividingBy: 60)))"
    }

    func updateVolume(value: DragGesture.Value) {

        //Updating Volume

        if value.location.x >= 0 && value.location.x <= UIScreen.main.bounds.width - 180 {

            let progress = value.location.x / (UIScreen.main.bounds.width - 180)
            voicePlayer.volume = Float(progress)
            withAnimation(Animation.linear(duration: 0.1)) {volume = value.location.x}
        }

    }
}

