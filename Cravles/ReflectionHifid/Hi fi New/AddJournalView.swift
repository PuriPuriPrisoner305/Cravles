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
    @State private var anim1 = false
    @State private var anim2 = false
    @State private var anim3 = false
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
                    if anim1 == false{
                        Image(systemName: "circlebadge")
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: h.size.width/10, height: h.size.width/10)
                            .padding(.top,h.size.width/7)
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .foregroundColor(Color.pulsatingColor)
                            .frame(width: h.size.width/10, height: h.size.width/10)
                            .padding(.top,h.size.width/7)
                    }
                    if anim1 == false{
                        Rectangle()
                            .frame(width: h.size.width/98, height: h.size.width/4, alignment: .leading)
                            .foregroundColor(Color.gray)
                    } else {
                        Rectangle()
                            .frame(width: h.size.width/98, height: h.size.width/4, alignment: .leading)
                            .foregroundColor(Color.pulsatingColor)
                    }
                    if anim2 == false {
                        Image(systemName: "circlebadge")
                            .resizable()
                            .frame(width: h.size.width/10, height: h.size.width/10)
                            .foregroundColor(Color.gray)
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: h.size.width/10, height: h.size.width/10)
                            .foregroundColor(Color.pulsatingColor)
                    }
                    
                   
                    if anim2 == false {
                        Rectangle()
                            .frame(width: h.size.width/90, height: h.size.width/4, alignment: .leading)
                            .foregroundColor(Color.gray)
                    } else {
                        Rectangle()
                            .frame(width: h.size.width/90, height: h.size.width/4, alignment: .leading)
                            .foregroundColor(Color.pulsatingColor)
                    }
                    if anim3 == false {
                        Image(systemName: "circlebadge")
                            .resizable()
                            .frame(width: h.size.width/10, height: h.size.width/10)
                            .foregroundColor(Color.gray)
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: h.size.width/10, height: h.size.width/10)
                            .foregroundColor(Color.pulsatingColor)
                    }
                  
                    
                }.padding()
                VStack{
                    NavigationLink(destination: JournalFeelingView(inputFeeling: $reflection[0], anim11: $anim1), isActive: $isLinkActive)
                    {
                            Button(action:{
                                self.isLinkActive = true
                            }){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .shadow(radius: 3)
                                    HStack{
                                        VStack(alignment:.leading){
                                            Text("Journal your feeling")
                                                .foregroundColor(Color.black)
                                                .font(Font.system(size:18,weight: .bold, design: .rounded))
                                            Text("how are you feeling?")
                                                .foregroundColor(Color.gray)
                                                .font(Font.system(size:18, design: .rounded))
                                        }

                                    }
                                   Text(">")
                                        .font(Font.system(size:20,weight: .bold, design: .rounded))
                                        .foregroundColor(Color.pulsatingColor)
                                        .padding(.leading,h.size.width-150)
                                                                
                                }.frame(width: h.size.width/1.4, height: h.size.width/4, alignment: .center)
                                   
                            }
                    }.padding(.top,h.size.width/7)
                    ZStack{
                        if anim1 == true {
                            NavigationLink(destination: JournalThoughtView(inputRain: $reflection[1], anim11: $anim2), isActive: $isPresented1)
                            {
                                    Button(action:{
                                        self.isPresented1 = true
                                    }){
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.white)
                                                .shadow(radius: 3)
                                            HStack{
                                                VStack(alignment:.leading){
                                                    Text("Journal your thought")
                                                        .foregroundColor(Color.black)
                                                        .font(Font.system(size:18,weight: .bold, design: .rounded))
                                                    Text("write what you think here")
                                                        .foregroundColor(Color.gray)
                                                        .font(Font.system(size:18, design: .rounded))
                                                }

                                            }
                                           Text(">")
                                                .font(Font.system(size:20,weight: .bold, design: .rounded))
                                                .foregroundColor(Color.pulsatingColor)
                                                .padding(.leading,h.size.width-150)
                                                                        
                                        }.frame(width: h.size.width/1.4, height: h.size.width/4, alignment: .center)
                                          
                                       
                                    }

                            }
                        } else {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .shadow(radius: 3)
                                    .opacity(0.7)
                                HStack{
                                    VStack(alignment:.leading){
                                        Text("Journal your thought")
                                            .foregroundColor(Color.textcapt)
                                            .font(Font.system(size:18,weight: .bold, design: .rounded))
                                        Text("write what you think here")
                                            .foregroundColor(Color.textcapt)
                                            .font(Font.system(size:18, design: .rounded))
                                    }

                                }
                               Text(">")
                                    .font(Font.system(size:20,weight: .bold, design: .rounded))
                                    .foregroundColor(Color.textcapt)
                                    .padding(.leading,h.size.width-150)
                                                            
                            }.frame(width: h.size.width/1.4, height: h.size.width/4, alignment: .center)
                            
                        }
                        
                           
                    }.padding(.top,h.size.width/9)
                    ZStack{
                        if anim2 == true {
                            NavigationLink(destination: JournalBodyView(inputRain: $reflection[2], quoteRain: $reflection[3], rainDataPass: rainData, reflect: $reflection, anim11: $anim3, shouldPopToRootView: $rootIsActive), isActive: $isPresented)
                            {
                                    Button(action:{
                                        self.isPresented = true
                                    }){
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.white)
                                                .shadow(radius: 3)
                                            HStack{
                                                VStack(alignment:.leading){
                                                    Text("Journal your body feeling")
                                                        .foregroundColor(Color.black)
                                                        .font(Font.system(size:18,weight: .bold, design: .rounded))
                                                    Text("what is your body feeling?")
                                                        .foregroundColor(Color.gray)
                                                        .font(Font.system(size:18, design: .rounded))
                                                }

                                            }
                                           Text(">")
                                                .font(Font.system(size:20,weight: .bold, design: .rounded))
                                                .foregroundColor(Color.pulsatingColor)
                                                .padding(.leading,h.size.width-90)
                                                                        
                                        }.frame(width: h.size.width/1.4, height: h.size.width/4, alignment: .center)
                                            
                                      
                                    }
                                
                            }
                        } else {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .shadow(radius: 3)
                                    .opacity(0.7)
                                HStack{
                                    VStack(alignment:.leading){
                                        Text("Journal your body feeling")
                                            .foregroundColor(Color.textcapt)
                                            .font(Font.system(size:18,weight: .bold, design: .rounded))
                                        Text("what is your body feeling?")
                                            .foregroundColor(Color.textcapt)
                                            .font(Font.system(size:18, design: .rounded))
                                    }

                                }
                               Text(">")
                                    .font(Font.system(size:20,weight: .bold, design: .rounded))
                                    .foregroundColor(Color.textcapt)
                                    .padding(.leading,h.size.width-150)
                                                            
                            }.frame(width: h.size.width/1.4, height: h.size.width/4, alignment: .center)
                                
                        }
                           
                    }.padding(.top,h.size.width/9)
                  
                }.padding(.leading,h.size.width/5)
                
            }
           
        }
        .navigationBarTitle(Text("New Journal").font(.title2), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            
            let newData = RainModel(dateReflection: Date(), quotes: reflection[3], reflection1: reflection[0], reflection2: reflection[1], reflection3: reflection[2])
            rainData.save(rain: newData)
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Save")
                .buttonStyle(BlueButton())
                
        }
                                            ))
           
        
            
    }
}

//struct AddJournalView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddJournalView(rainData: ObservableObjectRain())
//    }
//}

