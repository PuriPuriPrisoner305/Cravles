//
//  SimulationExerciseView.swift
//  Cravles
//
//  Created by Yani . on 22/11/21.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct SimulationExerciseView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var audioPlayer: AVAudioPlayer!
    @State var musicPlayer: AVAudioPlayer!

    @State private var favoriteVoice = "Female"
    var voiceStyle = ["Female", "Male"]

    @State private var voiceLevel: Float = 1
    @State private var musicLevel: Float = 1

    var body: some View {
        VStack (alignment: .center, spacing: 40) {
            Text("Instruction")

            VStack {
                Button(action: {
                    if self.audioPlayer.isPlaying && self.musicPlayer.isPlaying {
                        self.audioPlayer.pause()
                        self.musicPlayer.pause()
                    } else {
                        self.audioPlayer.play()
                        self.musicPlayer.play()
                    }
                }) {
                    Image(systemName: "play.circle.fill").resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
            }
//            ZStack {
//                Text("Play")
//            }
//            .onAppear(perform: {
//                playSounds("ambient.m4a")
//            })
//            GeometryReader { geo in

                VStack {
                    HStack {
                        Text("Voice")
                        Picker("What is your favorite voice?", selection: $favoriteVoice) {
                            ForEach(voiceStyle, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

//                    Text("Value: \(favoriteVoice)")

                    Slider(value: $voiceLevel, in: 0...1)
                    Text("\(voiceLevel, specifier: "%.1f") Voice")

                    HStack {
                        Text("Music")
                        Spacer()
                    }

                    Slider(value: $musicLevel, in: 0...1)
//                    Text("\(music, specifier: "%.f") Music")
                }
                .border(Color.red, width: 1)
                .padding(20)
//                .frame(width: geo.size.width * 0.9, alignment: .leading)
//                .padding(.top, geo.size.height / 50)
//            }
        }
        .frame(alignment: .center)
        .onAppear {
            let voiceSound = Bundle.main.path(forResource: "ambient", ofType: "m4a")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: voiceSound!))

            let musicSound = Bundle.main.path(forResource: "Open", ofType: "m4a")
            self.musicPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicSound!))
        }
    }

//    func playSounds(_ soundFileName: String) {
//        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
//            fatalError("Unable to find \(soundFileName) in bundle")
//        }
//
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
//        } catch {
//            print(error.localizedDescription)
//        }
//        audioPlayer.play()
//    }
}

struct SimulationExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationExerciseView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
