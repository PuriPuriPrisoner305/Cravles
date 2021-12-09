//
//  JournalingView.swift
//  Cravles
//
//  Created by Indah Nurindo on 30/11/2564 BE.
//

import SwiftUI

struct JournalingView: View {
    @Environment(\.managedObjectContext) var moc
    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    var colors: [Color] = [Color.pulsatingColor, Color.textFieldColor]
    @State  var isLinkActive1 = false
    @State var showingAdd = false
    @State var isLinkActive2 = false
    @StateObject var rainData = ObservableObjectRain()
    let tes = [1,2,3,4,]
    var body: some View {
        NavigationView{

            ScrollView{
                ForEach(rainData.data, id:\.id){ rain in
                    VStack{
                        ZStack{
                       Rectangle()
                                .frame(width:UIScreen.main.bounds.width-30, height: 100)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                .padding(8)
                                .shadow(radius: 5)
                        HStack{
                            
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
                           
                            VStack(alignment: .leading){
//                                if rainData.reflectionRain1.isEmpty || rainData.reflectionRain2.isEmpty || rainData.reflectionRain3.isEmpty{
//
//                                }
                                Text("\(rain.reflection1)" ?? "Suspended")
                                    .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.width/20, alignment: .topLeading)
                                   
                              
                                
                                Text( "\(rain.quotes )" ?? "you just completed i 0f 3 stages lest's finish it")
                                    .font(.system(size: 9))
                                    .frame(width: UIScreen.main.bounds.width/1.9, height: UIScreen.main.bounds.width/10, alignment: .topLeading)
                            }
                            .padding()
//                                Image(systemName: rains.isEmpty ? "checkmark.circle.fill":"minus.circle")
                            
                        
                        }
                        }
                    }.onTapGesture {
                       
                       
                    }
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
                                                       Image(systemName: "plus.square")
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
