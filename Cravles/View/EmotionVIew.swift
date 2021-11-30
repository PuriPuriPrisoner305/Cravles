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

    @State var moodSlider : Double = 2.0

    var data = Mood.moods

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack (spacing: 20) {

                    HStack {
                    }
                    .padding([.leading,.trailing], 8)
                    .frame(width: geo.size.width)
                    .font(.system(size: 22))

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
                        .font(Font.system(.title, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)

                    Text("How are you feeling?")
                        .font(Font.system(.title3, design: .rounded))
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)

                    Image(uiImage: data[Int(moodSlider)].moodImg)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width, height: width)

                    Text("\(data[Int(moodSlider)].mood)")

                    Slider(value: $moodSlider, in: 0...7, step: 1)
                        .padding(40)
                        .tint(Color.white)

                    NavigationLink(destination: ExercisePreView(), isActive: $isLinkActive) {
                        Button(action: {
                            self.isLinkActive = true
                        }) {
                            Text("Continue")
                                .font(Font.system(.title3, design: .rounded))
                                .fontWeight(.medium)
                                .frame(width: width - 20 , alignment: .center)
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
}



struct EmotionVIew_Previews: PreviewProvider {
    static var previews: some View {
        EmotionVIew()
    }
}
