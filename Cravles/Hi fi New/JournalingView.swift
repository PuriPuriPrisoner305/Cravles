//
//  JournalingView.swift
//  Cravles
//
//  Created by Indah Nurindo on 30/11/2564 BE.
//

import SwiftUI
import CoreData

struct JournalingView: View {
    @Environment(\.managedObjectContext) var moc
    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    var colors: [Color] = [Color.pulsatingColor, Color.textFieldColor]
    @State  var isLinkActive1 = false
    @State var showingAdd = false
    @State var isLinkActive2 = false
    @StateObject var rainData = ObservableObjectRain()
    @State var isID = ""
    let tes = [1,2,3,4,]
    var body: some View {
        NavigationView{

            ScrollView{
                ForEach(rainData.data, id:\.id){ rain in
//                    NavigationLink(destination: UpdateView(feelingRain1: $isID)){
                    VStack{
                        
                        ZStack{
                            if rain.reflection2.isEmpty && rain.reflection3.isEmpty{
                                Rectangle()
                                         .frame(width:UIScreen.main.bounds.width-30, height: 100)
                                         .cornerRadius(10)
                                         .foregroundColor(Color.pulsatingColor)
                                         .padding(8)
                                         .shadow(radius: 5)
                            } else {
                                Rectangle()
                                         .frame(width:UIScreen.main.bounds.width-30, height: 100)
                                         .cornerRadius(10)
                                         .foregroundColor(Color.white)
                                         .padding(8)
                                         .shadow(radius: 5)
                            }
                     
                        HStack{
                            if rain.reflection2.isEmpty && rain.reflection3.isEmpty{
                                ZStack(alignment:.center){
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.width/5.5)
                                        .cornerRadius(5)
                                        .foregroundColor(Color.white)
                                        .padding(.leading,0)
                               
                                        VStack(alignment:.center){
                                            Text( "\(rain.dateReflection.formatDay())" ?? "14")
                                                .foregroundColor(Color.black)
                                            Text( "\(rain.dateReflection.formatDateMonth())" ?? "Nov")
                                            
                                                .foregroundColor(Color.black)
                                        } .padding(.leading,4)
                        
                                }
                            } else {
                                ZStack(alignment:.center){
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.width/5.5)
                                        .cornerRadius(5)
                                        .foregroundColor(Color.textFieldColor)
                                        .padding(.leading,0)
                                    VStack(alignment:.center){
                                        Text( "\(rain.dateReflection.formatDay())" ?? "14")
                                            .foregroundColor(Color.white)
                                        Text( "\(rain.dateReflection.formatDateMonth())" ?? "Nov")
                                        
                                            .foregroundColor(Color.white)
                                    } .padding(.leading,4)
                                        
                                }
                            }
                          
                           
                            VStack(alignment: .leading){
//                                if rainData.reflectionRain1.isEmpty || rainData.reflectionRain2.isEmpty || rainData.reflectionRain3.isEmpty{
//
//                                }
                                if rain.reflection2.isEmpty && rain.reflection3.isEmpty {
                                    Text("you just completed 1 0f 3 stages lest's finish it")
                                        .font(.system(size: 9))
                                        .foregroundColor(Color.black)
                                        .frame(width: UIScreen.main.bounds.width/1.9, height: UIScreen.main.bounds.width/10, alignment: .topLeading)
                                }
                                else if rain.reflection3 == nil{
                                    Text("you just completed 2 0f 3 stages lest's finish it")
                                        .font(.system(size: 9))
                                        .foregroundColor(Color.black)
                                        .frame(width: UIScreen.main.bounds.width/1.9, height: UIScreen.main.bounds.width/10, alignment: .topLeading)
                                }
                                else if rain.reflection3.isEmpty && rain.reflection1.isEmpty && rain.reflection2.isEmpty{
                                    Text("you just completed 0 0f 3 stages lest's finish it")
                                        .font(Font.system(size:17,weight: .bold, design: .rounded))
                                        .foregroundColor(Color.black)
                                        .frame(width: UIScreen.main.bounds.width/1.9, height: UIScreen.main.bounds.width/10, alignment: .topLeading)
                                }
                                else {
                                    Text( "\(rain.quotes )")
                                        .font(.system(size: 9))
                                        .foregroundColor(Color.black)
                                        .frame(width: UIScreen.main.bounds.width/1.9, height: UIScreen.main.bounds.width/10, alignment: .topLeading)
                                   
                                   
                                }
                                
                                
                                    
                            }
                            .padding()
                            if rain.reflection2.isEmpty && rain.reflection3.isEmpty{
                                Image(systemName: "circle.fill")
                                    .foregroundColor(Color.white)
                            } else {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color.pulsatingColor)
                               
                            }
                            
                                
                                
                        }
                        }
                    }
//                    }
                }
                
            }.onAppear(perform: {
                rainData.read()
                print(isLinkActive1)
            })
            .navigationBarItems(leading:
                                    VStack{
                HStack{
                    Spacer()
                    NavigationLink(destination: AddJournalView(rainData: rainData, rootIsActive: $isLinkActive1), isActive: $isLinkActive1)
                                        {
                                                Button(action:{
                                                    
                                                    self.isLinkActive1 = true
                                                    
                                                }){
                                                    ZStack{
                                                       Image(systemName: "plus")
                                                            .foregroundColor(Color.black)
                                                    }
                                                }
                                        }
                }
                .navigationTitle("Recent Journaling")
              
            }.frame(width: UIScreen.main.bounds.width)
                
            )
        }
        .navigationBarBackButtonHidden(true)

    }
}

struct JournalingView_Previews: PreviewProvider {
    static var previews: some View {
        JournalingView()
    }
}
