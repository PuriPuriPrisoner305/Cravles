//
//  SheetView.swift
//  Cravles
//
//  Created by Yani . on 28/11/21.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    @StateObject var guideData = ExerciseGuideVM()

    @State var favoriteVoice: String = "Female"
    var voiceStyle = ["Female", "Male"]

    @State var voiceLevel: Float = 1
    @State var musicLevel: Float = 1

    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    @State var timer = Timer.publish(every: 0.1, on: .current, in: .default).autoconnect()

    var body: some View {

        GeometryReader { geo in
            VStack {
                Button("play.circle.fill") {
                    dismiss()
                }
                .font(.title)

                Text("Adjust the volume here,")
                    .font(Font.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal)

                Text("to make you more comfortable")
                    .font(Font.system(.title2, design: .rounded))
                    .fontWeight(.medium)
                    .padding(.horizontal)

                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(height: geo.size.height * 0.27)
                        .shadow(radius: 10)

                    VStack {

                        HStack {
                            Text("Voice")
                                .padding(.horizontal)
                            Picker("What is your favorite voice?", selection: $favoriteVoice) {
                                ForEach(voiceStyle, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.horizontal)
                        }

    //                    Text("Value: \(favoriteVoice)")

                        Slider(value: $voiceLevel, in: 0...1).onChange(of: voiceLevel) { n in
                            guideData.audioPlayer.volume = voiceLevel
                        }

    //                    Text("\(voiceLevel, specifier: "%.1f") Voice")

                        HStack {
                            Text("Music")
                                .padding(.horizontal)
                            Spacer()
                        }

                        Slider(value: $musicLevel, in: 0...1).onChange(of: musicLevel) { n in
                            guideData.musicPlayer.volume = musicLevel
                        }

    //                    Text("\(musicLevel, specifier: "%.1f") Music")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                }
    //                .frame(width: geo.size.width*0.80)
                .padding(20)

            }
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
