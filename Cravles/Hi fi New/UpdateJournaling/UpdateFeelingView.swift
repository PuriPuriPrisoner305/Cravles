////
////  UpdateFeelingView.swift
////  Cravles
////
////  Created by Indah Nurindo on 07/12/2564 BE.
////
//
//import SwiftUI
//
//struct UpdateFeelingView: View {
//    @Environment(\.managedObjectContext) var moc
//    @State private var feeling: String = ""
//    @State var currentValue = 0.0
//    @Environment(\.presentationMode) var presentationMode
//    @State public var feeling1 = ""
//    var feelingRain = ["ANGRY","ANXIOUS","SAD","TIRED","RELAXED","CONTENT","HAPPY","EXCITED"]
////    @Binding var reflectionPass: [String]
////    @ObservedObject var rainDataPass: ObservableObjectRain
//    
//    var assetId: NSManagedObjectID
//    var reflectino: Reflection
//    var body: some View {
//        ZStack{
//            GeometryReader{ h in
//                VStack{
//                    Image("\(self.$feeling)" + "a")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: h.size.width/1.5, height: h.size.width/2, alignment: .center)
//                        .padding(.top,h.size.width/4)
//                    ForEach(feelingRain) { h in
//                        if self.$feeling == "\(feelingRain[h])" {
//                            currentValue = h
//                        }
//                    }
//                   
//                    
//                    var currentValue = 
//                    Text("\(self.reflection)" ?? "\(feelingRain[0])")
//                        .font(Font.system(.title3, design: .rounded))
//                                                .fontWeight(.bold)
//                                                .tracking(2)
//                        .padding(.top,h.size.width/6)
//                    HStack{
//                        Slider(value: $currentValue,in:0 ... 7, step: 1)
//                            .accentColor(.black)
//                            .foregroundColor(Color.black)
//                            .padding()
//                    }.foregroundColor(Color.black)
//                        .padding(.bottom,h.size.width/5)
//                    let no = Int(currentValue)
//                   var feel = feelingRain[no]
//                    Button{
////                        let rain = Reflection(context: moc)
////                        feeling1 = ("\(feel)")
//                        inputFeeling = feel
////                        let newData = RainModel(dateReflection: Date(), quotes: reflectionPass[3], reflection1: feel, reflection2: "", reflection3: "")
////                        rainDataPass.save(rain: newData)
//                        rainData.update(id: NSManagedObjectID, key: "reflection1", value: "\(feel)")
////                        try? self.moc.save()
//                        self.presentationMode.wrappedValue.dismiss()
//                    }label: {
//                        ZStack{
//                            Rectangle()
//                                .frame(width: h.size.width/1.5, height: h.size.width/9)
//                               .foregroundColor(Color.textFieldColor)
//                                .cornerRadius(100)
//                           Text("Save")
//                                .font(Font.system(size:20,weight: .bold, design: .rounded))
//                                .foregroundColor(Color.white)
//                        }
//                    }
//                    .disabled(currentValue == 0.0)
//                    
//                        
//                }
//            }
//        }.navigationBarTitle(Text("How are you feeling?").font(.title2), displayMode: .inline)
//    }
//}
