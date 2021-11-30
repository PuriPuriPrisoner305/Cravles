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

    var body: some View {
        GeometryReader { geo in
            VStack {
//                Spacer(minLength: 0)

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

                Text("It's ok! \n Let's do some breathing exercise with me to help calm your mind")
                    .font(Font.system(.title, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(height: geo.size.height * 0.6)

//                Spacer(minLength: 0)

                NavigationLink(destination: ExerciseGuideView(), isActive: $isLinkActive) {
                    Button(action: {
                        self.isLinkActive = true
                    }) {
                        Text("Continue")
                            .font(Font.system(.title3, design: .rounded))
                            .fontWeight(.medium)
                            .frame(width: width - 20, alignment: .center)
                    }
                    .buttonStyle(BlueButton())
                }
                .frame(height: geo.size.height * 0.25)
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
        .background(Color(red: 253/255, green: 153/255, blue: 140/255))
    }
}

struct ExercisePreView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisePreView()
    }
}
