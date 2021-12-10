//
//  JournalBodyView.swift
//  Cravles
//
//  Created by Indah Nurindo on 30/11/2564 BE.
//

import SwiftUI

struct JournalBodyView: View {
    @Binding var inputRain: String
    @Binding var quoteRain: String

    @State private var showModal = false
    var colors: [Color] = [Color.pulsatingColor]
    @Environment(\.presentationMode) var presentationMode
    @State private var reflection = ""
    @Environment(\.managedObjectContext) var moc
    @State private var showingQuotes = false
    
    @ObservedObject var rainDataPass: ObservableObjectRain
//    @Binding var reflectionPass: [String]
    @State private var showJournalingView = false
    

    @Binding var reflect: [String]
    @Binding var anim11 : Bool
    @Binding var shouldPopToRootView : Bool
    
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
                            
                shouldPopToRootView = false
                            inputRain = reflection
//                            showingQuotes.toggle()
                            let quotesList = ["Set your goals high, and don’t stop till you get there.-Bo Jackson", "Start where you are. Use what you have. Do what you can. — Arthur Ashe", "Start where you are. Use what you have. Do what you can. — Arthur Ashe","Let us make our future now, and let us make our dreams tomorrow’s reality. – Malala Yousafzai","Just one small positive thought in the morning can change your whole day. — Dalai Lama","When you change your thoughts, remember to also change your world.—Norman Vincent Peale","The best way out is always through. ―Robert Frost", "Your life only gets better when you get better.- Brian Tracy", "Calm mind brings inner strength and self-confidence, so that’s very important for good health. — Dalai Lama", "Believe you can and you’re halfway there. Theodore Roosevelt","If I cannot do great things, I can do small things in a great way. – Martin Luther King Jr.","Boredom, anger, sadness, or fear are not ‘yours,’ not personal. They are conditions of the human mind. They come and go. Nothing that comes and goes is you. -Eckhart Tolle","When you feel sad, it’s okay. It’s not the end of the world. -Mac Miller","We generate fears while we sit. We overcome them by action.” – Dr. Henry Link","We generate fears while we sit. We overcome them by action.” – Dr. Henry Link","You cannot always control what goes on outside. But you can always control what goes on inside. — Wayne Dyer"]
                            let quotes = quotesList.randomElement()
                            quoteRain = quotes ?? ""


                            self.showModal.toggle()
                        }
                        .sheet(isPresented: $showModal) {
                            JournalQuotesView(inputRain: $inputRain, showModal: $showModal, randomQuotes: $quoteRain, reflection: $reflect, rainDataPass: rainDataPass, shouldPopToRootViewAgain: $shouldPopToRootView, anim11: $anim11)

                        }
//                        .sheet(isPresented: $showingQuotes) {
//                            let quotesList = ["quotes 1 when you feel sad, it's okay. it's not the end of the world. -Mac Miller","quotes 2", "qoutes 3"]
//                            let quotes = quotesList.randomElement()
//                            JournalQuotesView(inputRain: $inputRain,randomQuotes : quotes ?? "", showNextScreen: $showJournalingView)
                               
                           
//                        }
                        .disabled(reflection.isEmpty)
                        .frame(width: h.size.width/1.5, height: h.size.width/9, alignment: .center)
                            .font(Font.system(.title2, design: .rounded))
                            .background(Color.pulsatingColor)
                            .cornerRadius(50)
                            .foregroundColor(Color.white)
                            .shadow(color: .black, radius: 4)
                            .padding(.all)
//                            .background(
//                                NavigationLink(destination: JournalingView(), isActive: $showJournalingView) { }
//                                    .navigationBarTitle("")
//                                    .navigationBarBackButtonHidden(true)
//                            )
                   
                }
            }
        }.navigationBarTitle(Text("What's does your body feel?").font(.title2), displayMode: .inline)
    }

//    func showQuote() {
//
////        JournalQuotesView(inputRain: $inputRain,randomQuotes : quotes ?? "", showNextScreen: $showJournalingView)
//    }
}

//struct JournalBodyView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalBodyView()
//    }
//}
