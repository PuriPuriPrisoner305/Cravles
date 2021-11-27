//
//  Reflection2View.swift
//  Cravles
//
//  Created by Indah Nurindo on 25/11/2564 BE.
//

import SwiftUI

struct Reflection2View: View {
    @State private var showingSheet = false
    @State private var isPresented1 = false
    @State private var isPresented = false
    var body: some View {
        ZStack{
            GeometryReader { h in
                VStack{
                    
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: h.size.width/8, height: h.size.width/8)
                        .padding(.top,h.size.width/9)
                    Rectangle()
                        .frame(width: h.size.width/90, height: h.size.width/4, alignment: .leading)
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: h.size.width/8, height: h.size.width/8)
                    Rectangle()
                        .frame(width: h.size.width/90, height: h.size.width/4, alignment: .leading)
                    
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: h.size.width/8, height: h.size.width/8)
                    
                }.padding()
                VStack{
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image("12")
                            .resizable()
                            .frame(width: h.size.width/1.5, height: h.size.width/4, alignment: .center)
                            .padding(EdgeInsets(top: h.size.width/11, leading:h.size.width/4.8, bottom: 0, trailing:h.size.width/15))
                    }.fullScreenCover(isPresented: $isPresented, content: FeelingView.init)
                    Button {
                        isPresented1.toggle()
                    } label: {
                        Image("12")
                            .resizable()
                            .frame(width: h.size.width/1.5, height: h.size.width/4, alignment: .center)
                            .padding(EdgeInsets(top: h.size.width/11, leading:h.size.width/4.8, bottom: 0, trailing:h.size.width/15))
                    }.fullScreenCover(isPresented: $isPresented1, content: Rain1View.init)
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image("12")
                            .resizable()
                            .frame(width: h.size.width/1.5, height: h.size.width/4, alignment: .center)
                            .padding(EdgeInsets(top: h.size.width/11, leading:h.size.width/4.8, bottom: 0, trailing:h.size.width/15))
                        
                    }.sheet(isPresented: $showingSheet) {
                        Rain2View()
                    }
                }
                
            }
           
        }
    }
}

struct Nurturer: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(Color.black)
    }
}



struct Reflection2View_Previews: PreviewProvider {
    static var previews: some View {
        Reflection2View()
    }
}
