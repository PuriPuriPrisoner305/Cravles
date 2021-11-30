//
//  JournalThoughtView.swift
//  Cravles
//
//  Created by Indah Nurindo on 30/11/2564 BE.
//

import SwiftUI

struct JournalThoughtView: View {
    var colors: [Color] = [Color.pulsatingColor]
    @Environment(\.presentationMode) var presentationMode
    @State private var reflection = ""
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        ZStack{
            Color.pulsatingColor
                .ignoresSafeArea()
            GeometryReader{ h in
                VStack{
                    HStack{
                        Text("What's does your body feel?")
                            .font(Font.system(size:h.size.width/20, design: .rounded))
                            .foregroundColor(Color.white)
                    }
                    ZStack{
                        
                        TextEditor(text: $reflection)
                            .frame(width:h.size.width/1.15, height: h.size.width)
                            .cornerRadius(20)
                            .padding(EdgeInsets(top: h.size.width/5, leading:h.size.width/15, bottom: 0, trailing:h.size.width/15))
                           
                        if reflection.isEmpty {
                            Text("Type here")
                                .padding(.top,h.size.width/8)
                                .padding()
                                .opacity(0.25)
                                .frame(width:h.size.width/1.15, height: h.size.width, alignment: .topLeading)
                                .cornerRadius(20)
                                
                                
                        }
                    }
                        Button("Save") {
                            let rain = Reflection(context: moc)
                            rain.reflection2 = self.reflection
//                            try? self.moc.save()
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        .disabled(reflection.isEmpty)
                        .frame(width: h.size.width/2, height: h.size.width/7, alignment: .center)
                            .font(Font.system(.title2, design: .rounded))
                            .background(Color.white)
                            .cornerRadius(50)
                            .foregroundColor(Color.pulsatingColor)
                            .shadow(color: .black, radius: 4)
                            .padding(.top,h.size.width/4)
                   
                }
            }
        }
    }
}

struct JournalThoughtView_Previews: PreviewProvider {
    static var previews: some View {
        JournalThoughtView()
    }
}
