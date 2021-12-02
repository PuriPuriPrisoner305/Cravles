//
//  SheetView.swift
//  Cravles
//
//  Created by Yani . on 28/11/21.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    @ObservedObject var guideData: ExerciseGuideVM

    @State var favoriteVoice: String = "Female"
    var voiceStyle = ["Female", "Male"]

    @Binding var voiceLevel: Float
    @Binding var musicLevel: Float

    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    @State var timer = Timer.publish(every: 0.1, on: .current, in: .default).autoconnect()

    var body: some View {

        GeometryReader { geo in
            VStack {
                HStack {
                    Spacer()

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 1, green: 0.7, blue: 0.64))

                        Button(action : {
                            dismiss()
                        }){
                            Image(systemName: "xmark")
                                .tint(Color.white)
                        }
                    }
                    .frame(width: 30, height: 30)
                }
                .padding(.trailing, 20)
                .padding(.top, 20)

                VStack(alignment: .leading) {
                    Text("Adjust the volume here,")
                        .font(Font.system(.title, design: .default))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)

                    Text("to make you more comfortable")
                        .font(Font.system(.body, design: .default))
                        .fontWeight(.medium)

                }
                .foregroundColor(Color.white)
                .frame(width: geo.size.width - 20, height: geo.size.height * 0.12, alignment: .leading)
                .padding(.leading, 20)

//                ZStack {
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color(red: 1, green: 0.7, blue: 0.64))
//                        .frame(height: geo.size.height * 0.28)
////                        .shadow(radius: 10)
//
//
//
//                }
//    //                .frame(width: geo.size.width*0.80)
//                .padding(20)
                VStack {

                    HStack {

                        Image(systemName: "mic.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                            .padding(.leading, 10)

                        Text("Voice")

                        Spacer()

                        }
//
//                            Picker("What is your favorite voice?", selection: $favoriteVoice) {
//                                ForEach(voiceStyle, id: \.self) {
//                                    Text($0)
//                                }
//                            }
//                            .pickerStyle(SegmentedPickerStyle())
//                            .padding(.horizontal)
//                        }

//                    Text("Value: \(favoriteVoice)")
//                        Text("\(voiceLevel, specifier: "%.1f") Voice")

                    Slider(value: $voiceLevel, in: 0...1).onChange(of: voiceLevel) { n in
                        guideData.audioPlayer.volume = voiceLevel
                    }

                    HStack {

                        Image(systemName: "music.note")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                            .padding(.leading, 10)

                        Text("Music")
                        Spacer()
                    }

                    Slider(value: $musicLevel, in: 0...1).onChange(of: musicLevel) { n in
                        guideData.musicPlayer.volume = musicLevel
                    }

                }
                .foregroundColor(Color.white)
                .tint(Color.white)
                .padding(20)

            }
        }
        .background(Color(red: 253/255, green: 153/255, blue: 140/255))
    }
}

//struct SheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        SheetView(guideData: ExerciseGuideVM(voiceLevel: voiceLevel, musicLevel: musicLevel))
//            .previewDevice("iPhone 12")
//    }
//}
