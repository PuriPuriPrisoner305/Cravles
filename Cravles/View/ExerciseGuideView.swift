//
//  SimulationExerciseView.swift
//  Cravles
//
//  Created by Yani . on 22/11/21.
//

import SwiftUI
import AVFoundation
//import MediaPlayer

struct ExerciseGuideView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @StateObject var guideData = ExerciseGuideVM()

    @State private var showingSheet = false

    @State private var favoriteVoice = "Female"
    var voiceStyle = ["Female", "Male"]

    @State private var voiceLevel: Float = 1
    @State private var musicLevel: Float = 0.5

    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    @State var timer = Timer.publish(every: 0.1, on: .current, in: .default).autoconnect()

    var body: some View {
        GeometryReader { geo in
            VStack {

                Button("show sheet") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SheetView(voiceLevel: $voiceLevel, musicLevel: $musicLevel)
                }

                ZStack{

                    Circle()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: width)
                        .clipShape(Circle())
                        .foregroundColor(Color.white)

                    ZStack {

                        Image(systemName: "leaf")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: width / 3, height: width / 3)
                            .foregroundColor(Color(red: 0.86, green: 0.49, blue: 0.43))

                        //Circle kanan leaf
                        Circle()
                            .fill(Color(red: 0.88, green: 0.69, blue: 0.66))
                            .frame(width: 10, height: 10)
                            .offset(x: (width - 30) / 2)

                        //Circle atas leaf
                        Circle()
                            .fill(Color(red: 0.86, green: 0.49, blue: 0.43))
//                            .fill(Color.blue)
                            .frame(width: 10, height: 10)
                            .offset(y: (width - 30) / -2)

                        //Garis lingkaran 3/4
                        Circle()
                            .trim(from: 0, to: 0.75)
//                            .trim(from: 0, to: CGFloat(guideData.angle) / 360)
                            .stroke(Color(red: 220/255, green: 139/255, blue: 124/255), lineWidth: 2)
                            .frame(width: width - 30, height: width - 30)

//                        //Slider circle
//                        Circle()
//                            .fill(Color(red: 253/255, green: 153/255, blue: 140/255))
//                            .frame(width: 10, height: 10)
//                            //Moving View
//                            .offset(x: (width - 30) / 2)
//                            .rotationEffect(.init(degrees: guideData.angle))
//                            // gesture
//                            .gesture(DragGesture().onChanged(guideData.onChanged(value:)))

                    }
                    //Rotating View For Bottom Facing
                    //Mid 90 deg + 0.1 * 360 = 36
                    //Total 126
                    .rotationEffect(.init(degrees: 0))
                }

                Text("Take a deep breath")
                    .font(Font.system(.title, design: .default))
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(Color.white)

                HStack {
                    Button(action: {
                        guideData.audioPlayer.currentTime -= 10
                    }) {
                        Image(systemName: "gobackward.10")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(20)
                            .clipShape(Circle())
                    }

                    Button(action: guideData.play) {
                        Image(systemName: guideData.isPlaying ? "pause.fill" : "play.fill")
                            .font(.title)
                            .foregroundColor(Color(red: 253/255, green: 153/255, blue: 140/255))
                            .padding(20)
                            .background(Color.white)
                            .clipShape(Circle())
                    }

                    Button(action: {
                        let increase = guideData.audioPlayer.currentTime + 10
                        if increase < guideData.audioPlayer.duration {
                            guideData.audioPlayer.currentTime = increase
                        }
                    }) {
                        Image(systemName: "goforward.10")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(20)
                            .clipShape(Circle())
                    }
                }

                ZStack (alignment: .leading) {

                    Capsule()
                        .fill(Color.white.opacity(0.8))
                        .frame(height: 4)

                    ZStack {

                        Capsule()
                            .fill(Color.red)
                            .frame(width: guideData.line, height: 4)
//                            .gesture(DragGesture().onChanged({ value in
//                                let x = value.location.x
//                                guideData.line = x
//                            }).onEnded({ value in
//                                let x = value.location.x
//                                let screen = UIScreen.main.bounds.width - 30
//                                let percent = x / screen
//                                guideData.audioPlayer.currentTime = Double(percent) * guideData.audioPlayer.duration
//                            }))
//
//                            //Slider circle
//                            Circle()
//                                .fill(Color.white)
//                                .frame(width: 10, height: 10)


                    }
                }
                .padding(20)

                HStack {
                    Text(guideData.getCurrentTime(value: guideData.audioPlayer.currentTime))
                        .font(Font.system(.title3, design: .rounded))
                        .fontWeight(.medium)

                    Spacer()

                    Text(guideData.getCurrentTime(value: guideData.audioPlayer.duration))
                        .font(Font.system(.title3, design: .rounded))
                        .fontWeight(.medium)
                }
                .padding(.horizontal, 20)

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
            .frame(alignment: .top)

        }
        .background(Color(red: 253/255, green: 153/255, blue: 140/255))
        .onAppear(perform: guideData.fetch)
        .onReceive(timer) { _ in
            guideData.updateTimer()
            guideData.updateSliderTimer()
            
        }
    }

}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    @StateObject var guideData = ExerciseGuideVM()

    @State private var favoriteVoice = "Female"
    var voiceStyle = ["Female", "Male"]

    @Binding var voiceLevel: Float
    @Binding var musicLevel: Float

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

                        Slider(value: $voiceLevel, in: 0...1)
                        }
    //                    Text("\(voiceLevel, specifier: "%.1f") Voice")

                        HStack {
                            Text("Music")
                                .padding(.horizontal)
                            Spacer()
                        }

                        Slider(value: $musicLevel, in: 0...1)
                        
    //                    Text("\(musicLevel, specifier: "%.1f") Music")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                }
    //                .frame(width: geo.size.width*0.80)
                .padding(20)
            }
            .onReceive(timer) { _ in
                guideData.updateTimer()
            }
        }
    }
}

struct ExerciseGuideView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseGuideView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
