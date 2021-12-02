////
////  Reflection2View.swift
////  Cravles
////
////  Created by Indah Nurindo on 25/11/2564 BE.
////
//
//import SwiftUI
//
//struct Reflection2View: View {
//    @Environment(\.presentationMode) var presentationMode
////    @StateObject private var reflectionVM = ReflectionViewModel()
//    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
//    @State private var showingSheet = false
//    @State private var isPresented1 = false
//    @State private var isPresented = false
//    @State  var isLinkActive = false
//    @Environment(\.managedObjectContext) var moc
//    let todayMonth = Date().formatDateMonth()
//    let todayDay = Date().formatDay()
//    var colors: [Color] = [Color.pulsatingColor, Color.textFieldColor]
//    var body: some View {
//        ZStack{
//            GeometryReader { h in
//                VStack{
//                    
//                    Image(systemName: "checkmark.circle.fill")
//                        .resizable()
//                        .foregroundColor(Color.pulsatingColor)
//                        .frame(width: h.size.width/10, height: h.size.width/10)
//                        .padding(.top,h.size.width/7)
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
//                    NavigationLink(destination: FeelingView(), isActive: $isLinkActive)
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
//                    NavigationLink(destination: Rain1View(), isActive: $isPresented1)
//                    {
//                            Button(action:{
//                                self.isPresented1 = true
//                            }){
//                                ZStack{
//                                    Image("RectStepJournaling")
//                                            .resizable()
//                                            .frame(width: h.size.width/1.2, height: h.size.width/2.7, alignment: .center)
//                                    Text("Journal you thought")
//                                                                      .foregroundColor(Color.black)
//                                }.padding(.leading,h.size.width/7)
//                            }
//
//                    }
//                    NavigationLink(destination: Rain2View(), isActive: $isPresented)
//                    {
//                            Button(action:{
//                                self.isPresented = true
//                            }){
//                                ZStack{
//                                    Image("RectStepJournaling")
//                                            .resizable()
//                                            .frame(width: h.size.width/1.2, height: h.size.width/2.7, alignment: .center)
//                                    
//                                    Text("Journal your body feeling")
//                                                                      .foregroundColor(Color.black)
//                                }.padding(.leading,h.size.width/7)
//                            }
//                        
//                    }
//                }
//                
//            }
//           
//        }
//        .navigationTitle("New Journal")
//        .navigationBarItems(trailing: Button(action: {
//            let rain = Reflection(context: moc)
//            rain.dayReflection = self.todayDay
//            rain.monthReflection = self.todayMonth
//            try? self.moc.save()
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
//
//struct Nurturer: View {
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        Button("Press to dismiss") {
//            dismiss()
//        }
//        .font(.title)
//        .padding()
//        .background(Color.black)
//    }
//}
//
//
//
//struct Reflection2View_Previews: PreviewProvider {
//    static var previews: some View {
//        Reflection2View()
//    }
//}
