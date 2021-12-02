//
//  AddJournalView.swift
//  Cravles
//
//  Created by Indah Nurindo on 30/11/2564 BE.
//

import SwiftUI




struct AddJournalView: View {
    @ObservedObject var rainData : ObservableObjectRain
    @Environment(\.presentationMode) var presentationMode
    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    @State private var showingSheet = false
    @State private var isPresented1 = false
    @State private var isPresented = false
    @State private var isFullScreen = false
    @State var isLinkActive = false
    @State var reflection = ["","","",""]
    @Environment(\.managedObjectContext) var moc
    let todayDay = Date().formatDate()
    var colors: [Color] = [Color.pulsatingColor, Color.textFieldColor]
    
    @Binding var rootIsActive : Bool

    var body: some View {
        ZStack{
            GeometryReader { h in
                VStack{
                    if rainData.reflectionRain1.isEmpty{
                        Image(systemName: "circlebadge")
                            .resizable()
                            .foregroundColor(Color.pulsatingColor)
                            .frame(width: h.size.width/10, height: h.size.width/10)
                            .padding(.top,h.size.width/7)
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .foregroundColor(Color.pulsatingColor)
                            .frame(width: h.size.width/10, height: h.size.width/10)
                            .padding(.top,h.size.width/7)
                    }
                   
                    Rectangle()
                        .frame(width: h.size.width/90, height: h.size.width/4, alignment: .leading)
                        .foregroundColor(Color.pulsatingColor)
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: h.size.width/10, height: h.size.width/10)
                        .foregroundColor(Color.pulsatingColor)
                    Rectangle()
                        .frame(width: h.size.width/90, height: h.size.width/4, alignment: .leading)
                        .foregroundColor(Color.pulsatingColor)
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: h.size.width/10, height: h.size.width/10)
                        .foregroundColor(Color.pulsatingColor)
                    
                }.padding()
                VStack{
                    NavigationLink(destination: JournalFeelingView(inputFeeling: $reflection[0]), isActive: $isLinkActive)
                    {
                            Button(action:{
                                self.isLinkActive = true
                            }){
                                ZStack{
                                    Image("RectStepJournaling")
                                            .resizable()
                                            .frame(width: h.size.width/1.2, height: h.size.width/2.8, alignment: .center)
                                            .padding(.top,h.size.width/10)
                                                                  Text("Journal your feeling")
                                                                      .foregroundColor(Color.black)
                                }.padding(.leading,h.size.width/7)
                            }
                    }
                    NavigationLink(destination: JournalThoughtView(inputRain: $reflection[1]), isActive: $isPresented1)
                    {
                            Button(action:{
                                self.isPresented1 = true
                            }){
                                ZStack{
                                    Image("RectStepJournaling")
                                            .resizable()
                                            .frame(width: h.size.width/1.2, height: h.size.width/2.7, alignment: .center)
                                    Text("Journal you thought")
                                                                      .foregroundColor(Color.black)
                                }.padding(.leading,h.size.width/7)
                            }

                    }
                    NavigationLink(destination: JournalBodyView(inputRain: $reflection[2], quoteRain: $reflection[3], rainDataPass: rainData, reflect: $reflection, shouldPopToRootView: $rootIsActive), isActive: $isPresented)
                    {
                            Button(action:{
                                self.isPresented = true
                            }){
                                ZStack{
                                    Image("RectStepJournaling")
                                            .resizable()
                                            .frame(width: h.size.width/1.2, height: h.size.width/2.7, alignment: .center)
                                    
                                    Text("Journal your body feeling")
                                                                      .foregroundColor(Color.black)
                                }.padding(.leading,h.size.width/7)
                            }
                        
                    }
                }
                
            }
           
        }
        .navigationBarTitle(Text("\(todayDay)").font(.title2), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
//            let rain = Reflection(context: moc)
////            rain.dayReflection = self.todayDay
////            rain.monthReflection = self.todayMonth
//            try? self.moc.save()

            
            let newData = RainModel(dateReflection: Date(), quotes: reflection[3], reflection1: reflection[0], reflection2: reflection[1], reflection3: reflection[2])
            rainData.save(rain: newData)
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Save")
                .buttonStyle(BlueButton())
        }))
           
        
            
    }
}

//struct AddJournalView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddJournalView(rainData: ObservableObjectRain())
//    }
//}
