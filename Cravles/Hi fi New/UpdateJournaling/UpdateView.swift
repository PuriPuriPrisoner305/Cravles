////
////  UpdateUIView.swift
//  Cravles
//
//  Created by Indah Nurindo on 02/12/2564 BE.


import SwiftUI
import CoreData

struct UpdateView: View {
//    @Environment(\.presentationMode) var presentationMode
    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    @State private var showingSheet = false
    @State private var isPresented1 = false
    @State private var isPresented = false
    @State private var isFullScreen = false
    @State var isLinkActive = false
    @State var reflection = ["","","",""]
//    @Environment(\.managedObjectContext) var moc
    let todayDay = Date().formatDate()
    var colors: [Color] = [Color.pulsatingColor, Color.textFieldColor]
    @Binding var feelingRain1 : String
//    @Binding var rootIsActive : Bool

    var body: some View {
        ZStack{
            GeometryReader { h in
                VStack{
                    Image(systemName: "circlebadge")
                        .resizable()
                        .foregroundColor(Color.pulsatingColor)
                        .frame(width: h.size.width/10, height: h.size.width/10)
                        .padding(.top,h.size.width/7)
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

                
            }
           
        }
        .navigationBarTitle(Text("\(todayDay)").font(.title2), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
    
//            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Save")
                .buttonStyle(BlueButton())
        }))
           
        
            
    }
}
}

