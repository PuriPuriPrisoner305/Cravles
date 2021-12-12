//
//  JournalQuotesView.swift
//  Cravles
//
//  Created by Indah Nurindo on 30/11/2564 BE.
//

import SwiftUI

struct JournalQuotesView: View {
    @Binding var inputRain: String
    @Environment(\.presentationMode) var presentationMode

    @Binding var showModal: Bool
    @Binding var randomQuotes : String
    @Environment(\.managedObjectContext) var moc
    @State private var feeling = ""

    @Binding var reflection : [String]
    @ObservedObject var rainDataPass: ObservableObjectRain

    @Binding var shouldPopToRootViewAgain: Bool
    @Binding var anim11 : Bool
    var body: some View {
        
        GeometryReader{ h in
            VStack{
                HStack {
                    Spacer()

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 1, green: 0.7, blue: 0.64))

                        Button(action : {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "multiply")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .tint(Color.white)

                        }
                    }
                    .frame(width: 30, height: 30)

                }
                .padding(.top, 20)
                .padding(.trailing, 20)

                ZStack{
                    VStack{
                        VStack(alignment:.leading){
                            Image("petikdua")
                                .resizable()
                                .frame(width: h.size.width/7, height: h.size.width/10)

                                            Text("\(randomQuotes)")
                                .font(.system(size: h.size.width/12, weight: .bold, design: .default))
                                                .foregroundColor(Color.white)
                                                .padding(.top,h.size.width/20)
                                                .padding()
                        }.padding(.top,h.size.width/2.3)
                                        Rectangle()
                            .frame(width: h.size.width/1.2, height: 2, alignment: .center)
                            .foregroundColor(Color.white)
                            .opacity(0.5)
                            .padding(10)
                        Button(action: {
                            let newData = RainModel(dateReflection: Date(), quotes: reflection[3], reflection1: reflection[0], reflection2: reflection[1], reflection3: reflection[2])
                            rainDataPass.save(rain: newData)
//                            presentationMode.wrappedValue.dismiss()
                            print(newData.dateReflection)
                            print(newData.quotes)
                            print(newData.reflection1)
                            print(newData.reflection2)
                            print(newData.reflection3)
                            self.shouldPopToRootViewAgain = false
                            self.showModal = false
                            anim11 = true
                            
                            
                           
                            
                           
                           
                        }) {
                            Text("Done")
                                .font(Font.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                        }
                        .buttonStyle(BlueButton())
                        

                    }
                    
                }
            }
            
        }.background(Color.pulsatingColor)
            .ignoresSafeArea()

    }
}

//struct JournalQuotesView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalQuotesView(randomQuotes: )
//    }
//}

