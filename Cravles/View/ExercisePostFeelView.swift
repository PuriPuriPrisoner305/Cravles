//
//  ExercisePostView.swift
//  Cravles
//
//  Created by Yani . on 30/11/21.
//

import SwiftUI

struct ExercisePostFeelView: View {
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
                        ZStack {
                           
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

            }
        }
    }
}

struct ExercisePostView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisePostFeelView()
    }
}
