//
//  Reflection1View.swift
//  Cravles
//
//  Created by Indah Nurindo on 25/11/2564 BE.
//

//import SwiftUI
//import CoreData
//
//struct Reflection1View: View {
//    @Environment(\.managedObjectContext) var moc
////    @FetchRequest(entity: Reflection.entity(), sortDescriptors:
////                    [NSSortDescriptor(keyPath: \Reflection.monthReflection, ascending: false)]) var rains: FetchedResults<Reflection>
//    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
//    var colors: [Color] = [Color.pulsatingColor, Color.textFieldColor]
//    @State  var isLinkActive1 = false
//    @State var showingAdd = false
//    var body: some View {
//        NavigationView {
//            VStack{
//                VStack(alignment: .leading){
//                    Text("Recent Journaling")
//                        .font(Font.system(size:18, design: .rounded))
//                        Rectangle()
//                        .frame(width: 100, height: 3)
//                }
//                    
//                ScrollView{
//                    ForEach(rains, id:\.self){ rain in
//                        VStack{
//                            ZStack{
//                           Rectangle()
//                                    .frame(width:UIScreen.main.bounds.width-30, height: 100)
//                                    .cornerRadius(10)
//                                    .foregroundColor(Color.white)
//                                    .padding(8)
//                                    .shadow(radius: 5)
//                            HStack{
//                                
//                                ZStack(alignment:.center){
//                                    Rectangle()
//                                        .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.width/5.5)
//                                        .cornerRadius(5)
//                                        .foregroundColor(Color.textFieldColor)
//                                        .padding(.leading,0)
//                                    VStack(alignment:.center){
//                                        Text( "14")
//                                            .foregroundColor(Color.white)
//                                        Text( "Nov")
//                                            .foregroundColor(Color.white)
//                                    } .padding(.leading,4)
//                                        
//                                }
//                               
//                                VStack(alignment: .leading){
//                                    Text("Suspended")
//                                    
//                                    Text(rain.reflection2 ?? "you just completed i 0f 3 stages lest's finish it")
//                                        .font(.system(size: 9))
//                                }
//                                .padding()
////                                Image(systemName: rains.isEmpty ? "checkmark.circle.fill":"minus.circle")
//                                
//                            
//                            }
//                            }
//                        }
//                    }
//                }
//       
//                        
//        //                Text(rain.reflection1 ?? "haha")
//
//            }
////            .navigationBarTitle("Recent Journaling")
//            .navigationBarItems(trailing:  NavigationLink(destination: Reflection2View(), isActive: $isLinkActive1)
//                                {
//                                        Button(action:{
//                                            self.isLinkActive1 = true
//                                        }){
//                                            ZStack{
//                                               Image(systemName: "plus.square")
//                                                    .foregroundColor(Color.black)
//                                            }
//                                        }
//                                })
//          
//      
//        }
//
//        }
//}
//
//struct Reflection1View_Previews: PreviewProvider {
//    static var previews: some View {
//        Reflection1View()
//    }
//}
//
//
//                               
