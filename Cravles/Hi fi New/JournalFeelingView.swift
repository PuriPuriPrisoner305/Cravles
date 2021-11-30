//
//  JournalFeelingView.swift
//  Cravles
//
//  Created by Indah Nurindo on 30/11/2564 BE.
//

import SwiftUI

struct JournalFeelingView: View {
    @Environment(\.managedObjectContext) var moc
    @State var currentValue = 0.0
    
    @Environment(\.presentationMode) var presentationMode
    @State private var feeling = ""
    var feelingRain = ["ANGRY","ANXIOUS","SAD","TIRED","RELAXED","CONTENT","HAPPY","EXCITED"]
    var body: some View {
        ZStack{
            
            Color.pulsatingColor
                .ignoresSafeArea()
            GeometryReader{h in
                VStack{
                    Text("How are you feeling?")
                        .font(Font.system(size:h.size.width/20, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(10)
                        .padding(.bottom)
                    
                Image("\(Int(currentValue))")
                        .resizable()
                        .frame(width: h.size.width/1.5, height: h.size.width/2, alignment: .center)
                        .padding(.top,h.size.width/4)
                    let no = Int(currentValue)
                   var feel = feelingRain[no]
                    Text("\(feel)")
                        .font(Font.system(size:h.size.width/20,weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(.top,h.size.width/6)
                    HStack{
                        Slider(value: $currentValue,in:0 ... 7)
                            .accentColor(.white)
                            .padding()
                    }.foregroundColor(Color.white)
                        .padding(.bottom)
                    Button{
                        let rain = Reflection(context: moc)
                        feeling = ("\(Int(currentValue))")
//                        rain.feelingBefore = self.feeling
    
//                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        ZStack{
                            Rectangle()
                                .frame(width: h.size.width/2, height: h.size.width/7)
                                .foregroundColor(Color.white)
                                .cornerRadius(100)
                           Text("Save")
                                .font(Font.system(size:24,weight: .bold, design: .rounded))
                                .foregroundColor(Color.textFieldColor)
                        }
                    }
                    .disabled(currentValue == 0.0)
                    
                        
                }
            }
        }
    }
}

struct JournalFeelingView_Previews: PreviewProvider {
    static var previews: some View {
        JournalFeelingView()
    }
}
