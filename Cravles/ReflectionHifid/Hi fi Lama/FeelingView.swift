//
//  FeelingView.swift
//  Cravles
//
//  Created by Indah Nurindo on 25/11/2564 BE.
//

import SwiftUI

struct FeelingView: View {
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
                    Text("Hi John")
                        .font(Font.system(size:h.size.width/11,weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(.top, h.size.width/6)

                    Text("How are you feeling?")
                        .font(Font.system(size:h.size.width/20, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(.bottom,h.size.width/4)
                Image("\(Int(currentValue))")
                        .resizable()
                        .frame(width: h.size.width/10, height: h.size.width/10, alignment: .center)
                    let no = Int(currentValue)
                   var feel = feelingRain[no]
                    Text("\(feel)")
                        .font(Font.system(size:h.size.width/20,weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                    HStack{
                        Slider(value: $currentValue,in:0 ... 7)
                            .accentColor(.orange)
                            .padding()
                    }
                    Button{
                        let rain = Reflection(context: moc)
                        feeling = ("\(Int(currentValue))")
//                        rain.feelingBefore = self.feeling
    
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        ZStack{
                            Image("RectStepJournaling")
                           Text("Continue")
                                .font(Font.system(size:h.size.width/11,weight: .bold, design: .rounded))
                                .foregroundColor(Color.textFieldColor)
                        }
                    }
                    .disabled(currentValue == 0.0)
                    
                        
                }
            }
        }
    }
}

struct FeelingView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingView()
    }
}
