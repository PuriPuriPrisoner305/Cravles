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

    var body: some View {
//        NavigationView {
            GeometryReader { geo in
                VStack (spacing: 20) {

//                    HStack {
//                            Image(systemName: "arrow.left")
//                                .frame(width: 30)
//                            .onTapGesture(count: 1, perform: {
////                                self.mode.wrappedValue.dismiss()
//                            })
//                        Spacer()
//                        Image(systemName: "command")
//                            .frame(width: 30)
//                        Spacer()
//                        Image(systemName: "arrow.right")
//                            .frame(width: 30)
//                            .onTapGesture(count: 1, perform: {
//                                self.isLinkActive = true
//                            })
//
//                        NavigationLink(
//                            destination: ExercisePreView()
//                                .navigationBarHidden(true),
//                            isActive: $isLinkActive,
//                            label: {
//                                //no label
//                            })
//                    }
//                    .padding([.leading,.trailing], 8)
//                    .frame(width: geo.size.width)
//                    .font(.system(size: 22))

                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 1, green: 0.7, blue: 0.64))

                            Button(action : {
                                self.presentationMode.wrappedValue.dismiss()
                            }){
                                Image(systemName: "chevron.left")
                                    .tint(Color.white)
                            }
                        }
                        .frame(width: 30, height: 30)

                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)

                    Text("Hi, John")
                        .font(Font.system(.title, design: .default))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
//                        .padding(.horizontal)

                    Text("How are you feeling?")
                        .font(Font.system(.title3, design: .default))
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
//                        .padding(.horizontal)

                    Image(uiImage: data[Int(moodSlider)].moodImg)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width, height: width)

                    Text("\(data[Int(moodSlider)].mood)")
                        .font(Font.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .tracking(2)
                        .foregroundColor(Color.white)

                    Slider(value: $moodSlider, in: 0...7, step: 1)
                        .padding(40)
                        .tint(Color.white)

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
                .background(Color(red: 253/255, green: 153/255, blue: 140/255))

                .navigationBarHidden(true)
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
            .background(Color.white)
            .foregroundColor(Color(red: 0.91, green: 0.42, blue: 0.34))
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
