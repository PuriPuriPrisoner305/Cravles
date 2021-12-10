//
//  ExercisePreView.swift
//  Cravles
//
//  Created by Yani . on 26/11/21.
//

import SwiftUI

struct ExercisePreView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @Environment(\.managedObjectContext) private var viewContext

    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230

    @State var isLinkActive = false

    var audioData: Audio

    var body: some View {
        GeometryReader { geo in
            VStack {
//                Spacer(minLength: 0)
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: geo.size.height * 0.05)

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

                Text("It's ok! \n Let's do some \(audioData.title) with me to help calm your mind")
                    .font(Font.system(.title2, design: .default))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.6)

//                Spacer(minLength: 0)

                NavigationLink(destination: ExerciseGuideView(audioData: audioData), isActive: $isLinkActive) {
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
                .frame(height: geo.size.height * 0.24)
//                Spacer(minLength: 0)
            }
            .navigationBarHidden(true)
//            .navigationBarItems(leading: Button(action : {
//                self.presentationMode.wrappedValue.dismiss()
//            }){
//                Image(systemName: "chevron.backward.square.fill")
//                    .foregroundColor(Color(red: 1, green: 0.7, blue: 0.64))
//                    .tint(Color.white)
//            })

//            .frame(width: geo.size.width, height: geo.size.height)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct ExercisePreView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisePreView(audioData: Audio.audios[0])
    }
}
