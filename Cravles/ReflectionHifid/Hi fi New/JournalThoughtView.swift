//
//  JournalThoughtView.swift
//  Cravles
//
//  Created by Indah Nurindo on 30/11/2564 BE.
//

import SwiftUI

struct JournalThoughtView: View {
    @Binding var inputRain: String
    
    var colors: [Color] = [Color.pulsatingColor]
    @Environment(\.presentationMode) var presentationMode
    @State private var reflection = ""
    @Environment(\.managedObjectContext) var moc
    @Binding var anim11 : Bool
    var body: some View {
        ZStack{
            GeometryReader{ h in
                VStack{
                    ZStack(alignment: .topLeading) {

                        TextEditor(text:  $reflection)
                            .font(.custom("Helvetica", size: 24))
                            .padding(.all)
                        if reflection.isEmpty {
                            Text("Type here")
                                .font(.custom("Helvetica", size: 20))
                                .padding(.all)
                                .padding(.top,20)
                                .foregroundColor(Color(UIColor.placeholderText))
                        }
                        
                    }
                    Button{
                      inputRain = reflection
                    self.presentationMode.wrappedValue.dismiss()
                        anim11 = true

                    }label: {
                        ZStack{
                            Rectangle()
                                .frame(width: h.size.width/1.5, height: h.size.width/9)
                               .foregroundColor(Color.textFieldColor)
                                .cornerRadius(100)
                           Text("Save")
                                .font(Font.system(size:20,weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                        }.padding(.all)
                    } .disabled(reflection.isEmpty)
                }
            }
        }.navigationBarTitle(Text("What's on your mind?").font(.title2), displayMode: .inline)
    }
}
    

//struct JournalThoughtView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalThoughtView(inputRain2)
//    }
//}
