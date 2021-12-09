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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @Environment(\.managedObjectContext) private var viewContext

    @StateObject var guideData = ExerciseGuideVM()

    @State private var showingSheet = false

//    @State var activate = false

    @State private var favoriteVoice = "Female"
    var voiceStyle = ["Female", "Male"]

    @State var voiceLevel: Float = 1
    @State var musicLevel: Float = 0.3

    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    @State var timer = Timer.publish(every: 0.1, on: .current, in: .default).autoconnect()

    var audioData: Audio

    var body: some View {
        GeometryReader { geo in
            VStack {

                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 1, green: 0.7, blue: 0.64))

                        Button(action : {
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.left")
                                .tint(Color.white)
    //                            .foregroundColor(Color(red: 1, green: 0.7, blue: 0.64))
                        }
                    }
                    .frame(width: 30, height: 30)

                    Spacer()

                    Text(audioData.title)
                        .foregroundColor(Color.white)
                        .font(Font.system(.title3, design: .rounded))
                        .fontWeight(.bold)

                    Spacer()

                    ZStack {

                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 1, green: 0.7, blue: 0.64))

                        Button{
                            showingSheet.toggle()
                        } label: {
                            Image(systemName: "gear")
                                .foregroundColor(Color.white)
                        }
                        .sheet(isPresented: $showingSheet) {
                            SheetView(guideData: guideData, voiceLevel: $voiceLevel, musicLevel: $musicLevel)
                        }
                    }
                    .frame(width: 30, height: 30)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)

                Spacer()

                ZStack{

                    Circle()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width * 1.3, height: width * 1.3)
                        .clipShape(Circle())
                        .foregroundColor(Color.white.opacity(0.4))


                    Circle()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width * 1.15, height: width * 1.15)
                        .clipShape(Circle())
                        .foregroundColor(Color.white.opacity(0.7))

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

//                Text("Take a deep breath")
//                    .font(Font.system(.title, design: .default))
//                    .fontWeight(.bold)
////                    .padding(.bottom, 20)
//                    .foregroundColor(Color.white)
//                    .padding(.top, 20)
//                    .padding(.bottom, 60)

                HStack {
                    Button(action: {
                        guideData.audioPlayer.currentTime -= 10
                        guideData.musicPlayer.currentTime -= 10
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

                    Button(action: guideData.increaseTenSec) {
                        Image(systemName: "goforward.10")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(20)
                            .clipShape(Circle())
                    }
                }
                .padding(.top, 60)
                .padding(.bottom, 20)

                ZStack (alignment: .leading) {

                    Capsule()
                        .fill(Color.white.opacity(0.5))
                        .frame(height: 4)

                    ZStack {

                        //Slider circle
                        Circle()
                            .fill(Color.white)
                            .frame(width: 15, height: 15)
                            .offset(x: guideData.line / 2)

                        Capsule()
                            .fill(Color.white)
                            .frame(width: guideData.line, height: 4)
                            .gesture(DragGesture().onChanged(guideData.onChangedSlider(value: )))
//                            .gesture(DragGesture()
//                                .onChanged({ value in
//                                let x = value.location.x
//                                guideData.line = x
////                                let screen = UIScreen.main.bounds.width
////                                let percent = x / screen
////                                guideData.audioPlayer.currentTime = Double(percent) * guideData.audioPlayer.duration
//                            }).onEnded({ value in
//                                let x = value.location.x
//                                let screen = UIScreen.main.bounds.width
//                                let percent = x / screen
//                                guideData.audioPlayer.currentTime = Double(percent) * guideData.audioPlayer.duration
//                            }))



                    }
                }
                .padding(.trailing, 20)
                .padding(.leading, 20)

                HStack {
                    Text(guideData.getCurrentTime(value: guideData.audioPlayer.currentTime))
                        .font(Font.system(.body, design: .rounded))
//                        .fontWeight(.medium)

                    Spacer()

                    Text(guideData.getCurrentTime(value: guideData.audioPlayer.duration))
                        .font(Font.system(.body, design: .rounded))
//                        .fontWeight(.medium)
                }
                .foregroundColor(Color.white)
                .padding(.horizontal, 20)

                Spacer()

            }

        }
        .background(Color(red: 253/255, green: 153/255, blue: 140/255))
        .onAppear(perform: {guideData.fetch(sound: audioData.titleAudio, type: audioData.typeAudio)})
        .onReceive(timer) { _ in
            guideData.updateSliderTimer()
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $guideData.activated) {
            EmotionVIew()
        }

    }

}

struct ExerciseGuideView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseGuideView(audioData: Audio.audios[0]).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
