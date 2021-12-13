//
//  ExerciseView.swift
//  Cravles
//
//  Created by Yani . on 22/11/21.
//

import SwiftUI

struct ExerciseView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @Environment(\.managedObjectContext) private var viewContext

    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    
    @State var isLinkActive = false

    @State var moodSlider : Double = 1.0

    var data = Mood.moods

    var audioData: Audio

    var deviceName = DeviceName()

    var body: some View {
//        NavigationView {
            GeometryReader { geo in
                VStack (spacing: 20) {

                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: geo.size.height * 0.04)


                    HStack {
                        ZStack {
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color(red: 1, green: 0.7, blue: 0.64))

                            Button(action : {
                                self.presentationMode.wrappedValue.dismiss()
                            }){
                                Image(systemName: "chevron.left")
                                    .font(Font.system(.title2))
                                    .tint(Color.black)
                            }
                        }
                        .frame(width: 30, height: 30)

                        Spacer()
                    }
                    .padding(.leading, 10)

                    ZStack {
                        Image(uiImage: data[Int(moodSlider)].moodImg)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geo.size.width)

                        VStack {
                            Text("Hi, \(deviceName.deviceName)")
                                .font(Font.system(.title, design: .default))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
        //                        .padding(.horizontal)

                            Text("How are you feeling?")
                                .font(Font.system(.title3, design: .default))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
        //                        .padding(.horizontal)
                            Spacer()
                        }
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 1/2)

                    Text("\(data[Int(moodSlider)].mood)")
                        .font(Font.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .tracking(2)
                        .foregroundColor(Color.black)
                        .padding(.top, 40)

                    Slider(value: $moodSlider, in: 0...7, step: 1)
                        .padding(.bottom, 40)
                        .padding(.horizontal, 40)
                        .tint(Color.black)

                    NavigationLink(destination: ExercisePreView(audioData: audioData), isActive: $isLinkActive) {
                        Button(action: {
                            self.isLinkActive = true
                            print(audioData)
                        }) {
                            Text("Continue")
                                .font(Font.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .frame(width: geo.size.width * 0.7, alignment: .center)
                        }
                        .buttonStyle(BlueButton())
                    }
                    .frame(height: geo.size.height * 0.05)
                    .navigationBarHidden(true)

                    Spacer(minLength: 0)
                }
                .navigationBarHidden(true)
                .background(
                    VStack{
                        Color.pulsatingColor
                        Color.white
                    }).edgesIgnoringSafeArea(.vertical)
//                .navigationBarItems(leading: Button(action : {
//                    self.presentationMode.wrappedValue.dismiss()
//                }){
//                    Image(systemName: "chevron.backward.square.fill")
//                        .foregroundColor(Color(red: 1, green: 0.7, blue: 0.64))
//                        .tint(Color.white)
//                })


            }

    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.pulsatingColor)
            .foregroundColor(Color.white)
            .cornerRadius(25)
            .shadow(radius: 5)
//            .padding(.trailing, 20)
//            .padding(.leading, 20)
    }
}
struct WhiteButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.white)
            .foregroundColor(Color.pulsatingColor)
            .cornerRadius(25)
            .shadow(radius: 5)
//            .padding(.trailing, 20)
//            .padding(.leading, 20)
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(audioData: Audio.audios[0]).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
