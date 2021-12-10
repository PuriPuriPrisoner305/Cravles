//
//  EmotionVIew.swift
//  Cravles
//
//  Created by Ardyansyah Wijaya on 27/11/21.
//

import SwiftUI

struct EmotionVIew: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @Environment(\.managedObjectContext) private var viewContext

    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    
    @State var isLinkActive = false

    @State var moodSlider : Double = 4.0

    var data = Mood.moods

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack (spacing: 20) {

                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: geo.size.height * 0.04)

//                    HStack {
//                    }
//                    .padding([.leading,.trailing], 8)
//                    .frame(width: geo.size.width)
//                    .font(.system(size: 22))

                    HStack {
                        ZStack {
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color(red: 1, green: 0.7, blue: 0.64))
//
//                            Button(action : {
//                                self.presentationMode.wrappedValue.dismiss()
//                            }){
//                                Image(systemName: "chevron.left")
//                                    .tint(Color.white)
//                            }
                        }
                        .frame(width: 30, height: 30)

                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)

                    ZStack {
                        Image(uiImage: data[Int(moodSlider)].moodImg)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geo.size.width)

                        VStack {
                            Text("Nice")
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

                    NavigationLink(destination: ContentView(), isActive: $isLinkActive) {
                        Button(action: {
                            self.isLinkActive = true
                        }) {
                            Text("Done")
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
                .background(
                    VStack{
                        Color.pulsatingColor
                        Color.white
                    }).edgesIgnoringSafeArea(.vertical)

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
}



struct EmotionVIew_Previews: PreviewProvider {
    static var previews: some View {
        EmotionVIew()
    }
}
