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
//    let quotesList = ["quotes 1 when you feel sad, it's okay. it's not the end of the world. -Mac Miller","quotes 2", "qoutes 3"]
    @State var randomQuotes : String = ""
    @State private var isPresented = false
//    init(randomQuotes: String) {
//        self.randomQuotes = quotesList.randomElement()!
//    }
    @Environment(\.managedObjectContext) var moc
    @State private var feeling = ""
    var body: some View {
        GeometryReader{ h in
            VStack{
                HStack {
                    Spacer()
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(red: 1, green: 0.7, blue: 0.64))

                                        Button(action : {
                                            self.presentationMode.wrappedValue.dismiss()
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
                        Button("Done") {
                            inputRain = randomQuotes
                            self.presentationMode.wrappedValue.dismiss()
                        }.frame(width: h.size.width/2, height: h.size.width/7, alignment: .center)
                                                .font(.system(size: h.size.width/18, weight: .bold, design: .default))
                                                    .background(Color.white)
                                                    .cornerRadius(50)
                                                    .foregroundColor(Color.pulsatingColor)
                                                    .shadow(color: .black, radius: 4)
                                                    .padding(.top,h.size.width/4)
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

