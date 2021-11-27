//
//  Rain2View.swift
//  Cravles
//
//  Created by Indah Nurindo on 25/11/2564 BE.
//

import SwiftUI

struct Rain2View: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @StateObject private var reflectionVM = ReflectionViewModel()
    var colors: [Color] = [Color.pulsatingColor, Color.textFieldColor]
    var body: some View {
//        ZStack {
//            Color.primary.edgesIgnoringSafeArea(.all)
//            Button("Dismiss Modal") {
//                presentationMode.wrappedValue.dismiss()
//            }
//        }
        ZStack{
            Color.pulsatingColor
                .ignoresSafeArea()
            GeometryReader{ h in
                HStack{
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "lessthan.square.fill")
                            .resizable()
                            .frame(width: h.size.width/11, height: h.size.width/11, alignment: .leading)
                            .padding(.leading,h.size.width/11)
                    }
                    Text("What's does your body feel?")
                        .font(Font.system(.title2, design: .rounded))
                }
                VStack{
                    ZStack{
                       
                        TextEditor(text: $reflectionVM.rain2)
                            .frame(width:h.size.width/1.15, height: h.size.width)
                            .background(Color.black.opacity(0.5))
                            .background(Color.textFieldColor)
                            .cornerRadius(20)
                            .padding(EdgeInsets(top: h.size.width/5, leading:h.size.width/15, bottom: 0, trailing:h.size.width/15))
                            
                           
                        if reflectionVM.rain2.isEmpty {
                            Text("Type here")
                                .padding(.top,h.size.width/8)
                                .padding()
                                .opacity(0.25)
                                .frame(width:h.size.width/1.15, height: h.size.width, alignment: .topLeading)
                                .cornerRadius(20)
                               
                        }
                    }
                    .padding(.bottom,h.size.width/3)
                    Button("Save") {
                        reflectionVM.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(reflectionVM.rain2.isEmpty)
                    .frame(width: h.size.width/2, height: h.size.width/7, alignment: .center)
                        .font(Font.system(.title2, design: .rounded))
                        .background(Color.white)
                        .cornerRadius(50)
                        .foregroundColor(Color.pulsatingColor)
                        .shadow(color: .black, radius: 4)
                }
               
            }
        }
    }
}

struct Rain2View_Previews: PreviewProvider {
    static var previews: some View {
        Rain2View()
    }
}
