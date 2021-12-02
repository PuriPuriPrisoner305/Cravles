//
//  JournalBodyView.swift
//  Cravles
//
//  Created by Indah Nurindo on 30/11/2564 BE.
//

import SwiftUI

struct JournalBodyView: View {
    @Binding var inputRain: String
    
    var colors: [Color] = [Color.pulsatingColor]
    @Environment(\.presentationMode) var presentationMode
    @State private var reflection = ""
    @Environment(\.managedObjectContext) var moc
    @State private var showingQuotes = false
    
    @ObservedObject var rainDataPass: ObservableObjectRain
    @Binding var reflectionPass: [String]
    @State private var showJournalingView = false
    
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
                        Button("Save") {
//                            inputRain2.reflectionRain2 = reflection
                            
//                            let rain = Reflection(context: moc)
//                            rain.reflection2 = self.reflection
//                            try? self.moc.save()
                            inputRain = reflection
                            
                            showingQuotes.toggle()
                        }.sheet(isPresented: $showingQuotes) {
                            let quotesList = ["quotes 1 when you feel sad, it's okay. it's not the end of the world. -Mac Miller","quotes 2", "qoutes 3"]
                            let quotes = quotesList.randomElement()
                            JournalQuotesView(inputRain: $inputRain,randomQuotes : quotes ?? "", rainDataPass: rainDataPass, reflectionPass: $reflectionPass, showNextScreen: $showJournalingView)
                               
                           
                        }
                        .disabled(reflection.isEmpty)
                        .frame(width: h.size.width/1.5, height: h.size.width/9, alignment: .center)
                            .font(Font.system(.title2, design: .rounded))
                            .background(Color.pulsatingColor)
                            .cornerRadius(50)
                            .foregroundColor(Color.white)
                            .shadow(color: .black, radius: 4)
                            .padding(.all)
                            .background(
                                NavigationLink(destination: JournalingView(), isActive: $showJournalingView) { }
                                    .navigationBarTitle("")
                                    .navigationBarBackButtonHidden(true)
                            )
                   
                }
            }
        }.navigationBarTitle(Text("What's does your body feel?").font(.title2), displayMode: .inline)
    }
}

//struct JournalBodyView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalBodyView()
//    }
//}
