////
////  ExercisePlayView.swift
////  Cravles
////
////  Created by Yani . on 24/11/21.
////
//
///* --------------INI CONTOH PROJECT------------- */
//
//import SwiftUI
//
//struct ExercisePlayView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @StateObject var audioData = ExerciseVM()
//    // Far Smaller Size Phones
//    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
//    @State var timer = Timer.publish(every: 0.3, on: .current, in: .default).autoconnect()
//
//    @State private var showingAlert = true
//
//    var body: some View {
//
//        VStack {
//
//            VStack {
////                Spacer(minLength: 0)
//
//                Text(audioData.voice.title)
//                    .font(Font.system(.title, design: .rounded))
//                    .fontWeight(.heavy)
//                    .padding()
////                    .lineLimit(1)
//
//                Text(audioData.getCurrentTime(value: audioData.voicePlayer.duration - audioData.voicePlayer.currentTime))
//                    .font(Font.system(.title3, design: .rounded))
//                    .fontWeight(.medium)
//                    .padding(.bottom, 40)
//                    .padding(.horizontal)
//
//                ZStack{
//
//                    //Album Image...
//                    Image(uiImage: audioData.voice.artwork)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: width, height: width)
//                        .clipShape(Circle())
//
//                    ZStack {
//
//                        Button(action: audioData.play) {
//                            Image(systemName: audioData.isPlaying ? "pause.fill" : "play.fill")
//                                .font(.title)
//                                .foregroundColor(.gray)
//                                .padding(20)
//                                .background(Color.orange)
//                                .clipShape(Circle())
//                        }
//
//                        //Slider
//                        Circle()
//                            .trim(from: 0, to: 0.8)
//                            .stroke(Color.black.opacity(0.06), lineWidth: 4)
//                            .frame(width: width + 45, height: width + 45)
//
//                        Circle()
//                            .trim(from: 0, to: CGFloat(audioData.angle) / 360)
//                            .stroke(Color.orange, lineWidth: 4)
//                            .frame(width: width + 45, height: width + 45)
//
//                        //Slider circle
//                        Circle()
//                            .fill(Color.orange)
//                            .frame(width: 25, height: 25)
//                            //Moving View
//                            .offset(x: (width + 45) / 2)
//                            .rotationEffect(.init(degrees: audioData.angle))
//                            // gesture
//                            .gesture(DragGesture().onChanged(audioData.onChanged(value:)))
//
//                    }
//                    //Rotating View For Bottom Facing
//                    //Mid 90 deg + 0.1 * 360 = 36
//                    //Total 126
//                    .rotationEffect(.init(degrees: 0))
//
//                    //Time text
//
//                    Text(audioData.getCurrentTime(value: audioData.voicePlayer.currentTime))
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black)
//                        .offset(x: UIScreen.main.bounds.height < 750 ? -65 : -85, y: (width + 60) / 2)
//
//                }
//
//                //Volume control
//
//                HStack(spacing: 15) {
//
//                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
//
//                        Capsule()
//                            .fill(Color.black.opacity(0.06))
//                            .frame(height: 4)
//
//                        Capsule()
//                            .fill(Color.orange)
//                            .frame(width: audioData.volume, height: 4)
//
//                        //Slider
//                        Circle()
//                            .fill(Color.orange)
//                            .frame(width: 20, height: 20)
//                        //gesture
//                            .offset(x: audioData.volume)
//                            .gesture(DragGesture().onChanged(audioData.updateVolume(value:)))
//                    }
//                    //default frame
//                    .frame(width: UIScreen.main.bounds.width - 160)
//
//                }
//                .padding(.top, 25)
//
//                Spacer(minLength: 0)
//            }
//
//        }
//        .alert(isPresented: $showingAlert) {
//            Alert(title: Text("Tips"), message: Text("Use earphone for better experience"), dismissButton: .default(Text("Close")))
//        }
//
//        //fetching voice
//        .onAppear(perform: audioData.fetchVoice)
//        .onReceive(timer) { _ in
//            audioData.updateTimer()
//        }
//    }
//
//}
//
//struct ExercisePlayView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExercisePlayView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
