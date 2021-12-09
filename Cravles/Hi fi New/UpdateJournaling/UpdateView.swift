////
////  UpdateUIView.swift
////  Cravles
////
////  Created by Indah Nurindo on 02/12/2564 BE.
////
//
//import SwiftUI
//
//struct UpdateView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
//    @State private var showingSheet = false
//    @State private var isPresented1 = false
//    @State private var isPresented = false
//    @State private var isFullScreen = false
//    @State var isLinkActive = false
//    let todayDay = Date().formatDate()
//    var colors: [Color] = [Color.pulsatingColor, Color.textFieldColor]
//    @Binding var idReflection : Int
//    var reflectino: Reflection
//    var body: some View {
//        ZStack{
//            GeometryReader { h in
//                
//                VStack{
//                    Image(systemName: "checkmark.circle.fill")
//                        .resizable()
//                        .foregroundColor(Color.pulsatingColor)
//                        .frame(width: h.size.width/10, height: h.size.width/10)
//                        .padding(.top,h.size.width/7)
//                    print("\(reflectino.reflection1 )")
//                
//                    Image(systemName: "checkmark.circle.fill")
//                        .resizable()
//                        .foregroundColor(Color.pulsatingColor)
//                        .frame(width: h.size.width/10, height: h.size.width/10)
//                        .padding(.top,h.size.width/7)
//                        
//                    
//
//                    Rectangle()
//                        .frame(width: h.size.width/90, height: h.size.width/4, alignment: .leading)
//                        .foregroundColor(Color.pulsatingColor)
//                    Image(systemName: "checkmark.circle.fill")
//                        .resizable()
//                        .frame(width: h.size.width/10, height: h.size.width/10)
//                        .foregroundColor(Color.pulsatingColor)
//                    Rectangle()
//                        .frame(width: h.size.width/90, height: h.size.width/4, alignment: .leading)
//                        .foregroundColor(Color.pulsatingColor)
//                    Image(systemName: "checkmark.circle.fill")
//                        .resizable()
//                        .frame(width: h.size.width/10, height: h.size.width/10)
//                        .foregroundColor(Color.pulsatingColor)
//
//                }.padding()
//                VStack{
//                    NavigationLink("reflection1", destination: UpdateFeelingView()
//                    {
//                            Button(action:{
//                                self.isLinkActive = true
//                            }){
//                                ZStack{
//                                    Image("RectStepJournaling")
//                                            .resizable()
//                                            .frame(width: h.size.width/1.2, height: h.size.width/2.8, alignment: .center)
//                                            .padding(.top,h.size.width/10)
//                                                                  Text("Journal your feeling")
//                                                                      .foregroundColor(Color.black)
//                                }.padding(.leading,h.size.width/7)
//                            }
//                    }
////                    NavigationLink(destination: JournalThoughtView(inputRain: $reflection[1]), isActive: $isPresented1)
////                    {
////                            Button(action:{
////                                self.isPresented1 = true
////                            }){
////                                ZStack{
////                                    Image("RectStepJournaling")
////                                            .resizable()
////                                            .frame(width: h.size.width/1.2, height: h.size.width/2.7, alignment: .center)
////                                    Text("Journal you thought")
////                                                                      .foregroundColor(Color.black)
////                                }.padding(.leading,h.size.width/7)
////                            }
////
////                    }
////                    NavigationLink(destination: JournalBodyView(), isActive: $isPresented)
////                    {
////                            Button(action:{
////                                self.isPresented = true
////                            }){
////                                ZStack{
////                                    Image("RectStepJournaling")
////                                            .resizable()
////                                            .frame(width: h.size.width/1.2, height: h.size.width/2.7, alignment: .center)
////
////                                    Text("Journal your body feeling")
////                                                                      .foregroundColor(Color.black)
////                                }.padding(.leading,h.size.width/7)
////                            }
////
////                    }
//                }
//
//            }
//
//        }
//        .navigationBarTitle(Text("\(todayDay)").font(.title2), displayMode: .inline)
//        .navigationBarItems(trailing: Button(action: {
//            
//            self.presentationMode.wrappedValue.dismiss()
//        }, label: {
//            Text("Save")
//                .buttonStyle(BlueButton())
//        }))
//
//
//
//    }
//}
