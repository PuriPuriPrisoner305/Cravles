//
//  JournalFeelingView.swift
//  Cravles
//
//  Created by Indah Nurindo on 30/11/2564 BE.
//

import SwiftUI

struct JournalFeelingView: View {
    @Binding var inputFeeling: String
    @Environment(\.managedObjectContext) var moc
    @State var currentValue = 0.0
    
    @Environment(\.presentationMode) var presentationMode
    @State public var feeling1 = ""
    var feelingRain = ["ANGRY","ANXIOUS","SAD","TIRED","RELAXED","CONTENT","HAPPY","EXCITED"]
    @Binding var reflectionPass: [String]
    @ObservedObject var rainDataPass: ObservableObjectRain
    
    var body: some View {
        ZStack{
            GeometryReader{h in
                VStack{
                Image("\(Int(currentValue))" + "a")
                        .resizable()
                        .frame(width: h.size.width/1.5, height: h.size.width/2, alignment: .center)
                        .padding(.top,h.size.width/4)
                    let no = Int(currentValue)
                   var feel = feelingRain[no]
                    Text("\(feel)")
                        .font(Font.system(size:h.size.width/20,weight: .bold, design: .rounded))
                        .padding(.top,h.size.width/6)
                    HStack{
                        Slider(value: $currentValue,in:0 ... 7)
                            .accentColor(.black)
                            .foregroundColor(Color.black)
                            .padding()
                    }.foregroundColor(Color.black)
                        .padding(.bottom,h.size.width/5)
                    Button{
//                        let rain = Reflection(context: moc)
//                        feeling1 = ("\(feel)")
                        inputFeeling = feel
                        let newData = RainModel(dateReflection: Date(), quotes: reflectionPass[3], reflection1: feel, reflection2: "", reflection3: "")
                        rainDataPass.save(rain: newData)
    
//                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        ZStack{
                            Rectangle()
                                .frame(width: h.size.width/1.5, height: h.size.width/9)
                               .foregroundColor(Color.textFieldColor)
                                .cornerRadius(100)
                           Text("Save")
                                .font(Font.system(size:20,weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                        }
                    }
                    .disabled(currentValue == 0.0)
                    
                        
                }
            }
        }.navigationBarTitle(Text("How are you feeling?").font(.title2), displayMode: .inline)
    }
}

//struct JournalFeelingView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalFeelingView()
//    }
//}
