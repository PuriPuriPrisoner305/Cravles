//
//  ExerciseGuideVM.swift
//  Cravles
//
//  Created by Yani . on 25/11/21.
//

import SwiftUI
import AVFoundation

let url = URL(fileURLWithPath: Bundle.main.path(forResource: "ambient", ofType: "m4a")!)

class ExerciseGuideVM: ObservableObject {

    @Published var audioPlayer = try! AVAudioPlayer(contentsOf: url)
    @Published var musicPlayer: AVAudioPlayer!

    @Published var isPlaying = false

    @Published var angle : Double = 0

    @Published var line : Double = 0

    func fetch() {

        let voiceSound = Bundle.main.path(forResource: "ambient", ofType: "m4a")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: voiceSound!))

        let musicSound = Bundle.main.path(forResource: "Open", ofType: "m4a")
        musicPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicSound!))
        
    }

    func play() {

        if audioPlayer.isPlaying {
            audioPlayer.pause()
            musicPlayer.pause()
        } else {
            audioPlayer.play()
            musicPlayer.play()
        }

        isPlaying = audioPlayer.isPlaying
    }

    func onChanged(value: DragGesture.Value) {
        let vector = CGVector(dx: value.location.x, dy: value.location.y)

        //12.5 = 25 ==> Circle Radius
        let radians = atan2(vector.dy - 12.5,  vector.dx - 12.5)
        let tempAngle = radians * 180 / .pi

        let angle = tempAngle < 0 ? 2 + tempAngle : tempAngle

        //Since maximum slide is 0.75
        //0.75 * 36 = 270

        if angle <= 270 {

            //getting time
            let progress = angle / 270
            let time = TimeInterval(progress) * audioPlayer.duration
            audioPlayer.currentTime = time
            audioPlayer.play()

            musicPlayer.play()

            withAnimation(Animation.linear(duration: 0.1)){ self.angle = Double(angle)}
        }
    }

    func updateTimer() {
        let currentTime = audioPlayer.currentTime
        let total = audioPlayer.duration
        let progress = currentTime / total

        withAnimation(Animation.linear(duration: 0.1)) {
            self.angle = Double(progress) * 270
        }
        isPlaying = audioPlayer.isPlaying
    }

    func getCurrentTime(value: TimeInterval) -> String {

        return "\(Int(value / 60)):\(Int(value.truncatingRemainder(dividingBy: 60)) < 10 ? "0" : "")\(Int(value.truncatingRemainder(dividingBy: 60)))"
    }

    func updateSliderTimer() {
        if audioPlayer.isPlaying {
            let screen = UIScreen.main.bounds.width - 40
            let value = audioPlayer.currentTime / audioPlayer.duration
            self.line = screen * CGFloat(value)
        }
    }
}

