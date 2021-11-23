//
//  ExercisePlayView.swift
//  Cravles
//
//  Created by Yani . on 24/11/21.
//

import SwiftUI

struct ExercisePlayView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @StateObject var audioData = SimulationExerciseVM()
    // Far Smaller Size Phones
    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    @State var timer = Timer.publish(every: 0.3, on: .current, in: .default).autoconnect()

    var body: some View {

        VStack {

            //Topview

            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                }

                Spacer(minLength: 0)

                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.black)
                }
            }
            .padding()

            VStack {
                Spacer(minLength: 0)

                ZStack{

                    //Album Image...
                    Image(uiImage: audioData.voice.artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: width)
                        .clipShape(Circle())

                    ZStack {

                        //Slider
                        Circle()
                            .trim(from: 0, to: 0.8)
                            .stroke(Color.black.opacity(0.06), lineWidth: 4)
                            .frame(width: width + 45, height: width + 45)

                        Circle()
                            .trim(from: 0, to: CGFloat(audioData.angle) / 360)
                            .stroke(Color.orange, lineWidth: 4)
                            .frame(width: width + 45, height: width + 45)

                        //Slider circle
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 25, height: 25)
                            //Moving View
                            .offset(x: (width + 45) / 2)
                            .rotationEffect(.init(degrees: audioData.angle))
                            // gesture
                            .gesture(DragGesture().onChanged(audioData.onChanged(value:)))

                    }
                    //Rotating View For Bottom Facing
                    //Mid 90 deg + 0.1 * 360 = 36
                    //Total 126
                    .rotationEffect(.init(degrees: 126))

                    //Time text

                    Text(audioData.getCurrentTime(value: audioData.voicePlayer.currentTime))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .offset(x: UIScreen.main.bounds.height < 750 ? -65 : -85, y: (width + 60) / 2)

                    Text(audioData.getCurrentTime(value: audioData.voicePlayer.duration))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .offset(x: UIScreen.main.bounds.height < 750 ? 65 : 85, y: (width + 60) / 2)

                }

                Text(audioData.voice.title)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.top, 25)
                    .padding(.horizontal)
                    .lineLimit(1)

                Text(audioData.voice.artist)
                    .foregroundColor(.gray)
                    .padding(.top, 5)

                Text(audioData.voice.type)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.vertical, 6)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(5)
                    .padding(.top)

                HStack(spacing: 55) {

                    Button(action: {}) {
                        Image(systemName: "backward.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }

                    Button(action: audioData.play) {
                        Image(systemName: audioData.isPlaying ? "pause.fill" : "play.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding(20)
                            .background(Color.orange)
                            .clipShape(Circle())
                    }

                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.top, 25)

                //Volume control

                HStack(spacing: 15) {
                    Image(systemName: "minus")
                        .foregroundColor(.black)

                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {

                        Capsule()
                            .fill(Color.black.opacity(0.06))
                            .frame(height: 4)

                        Capsule()
                            .fill(Color.orange)
                            .frame(width: audioData.volume, height: 4)

                        //Slider
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 20, height: 20)
                        //gesture
                            .offset(x: audioData.volume)
                            .gesture(DragGesture().onChanged(audioData.updateVolume(value:)))
                    }
                    //default frame
                    .frame(width: UIScreen.main.bounds.width - 160)

                    Image(systemName: "plus")
                        .foregroundColor(.black)
                }
                .padding(.top, 25)

                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity)
            .background(Color.gray)
            .cornerRadius(35)

            HStack(spacing: 0) {
                ForEach(buttons, id: \.self){ name in
                    Button(action: {}) {
                        Image(systemName: name)
                            .font(.title2)
                            .foregroundColor(.white)
                    }

                    if name != buttons.last{Spacer(minLength: 0)}
                }
                .padding(.horizontal, 35)
                .padding(.top, 25)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom != 0 ? 5 : 15)
            }
        }
        .background(
            VStack {
                Color.blue
                Color.yellow
            }
                .ignoresSafeArea(.all, edges: .all)
        )
        //fetching voice
        .onAppear(perform: audioData.fetchVoice)
        .onReceive(timer) { _ in
            audioData.updateTimer()
        }
    }

    //Button
    var buttons = ["suit.heart.fill", "star.fill", "eye.fill", "square.and.arrow.up.fill"]
}

struct ExercisePlayView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisePlayView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
