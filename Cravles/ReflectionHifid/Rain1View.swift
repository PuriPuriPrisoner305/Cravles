//
//  Rain1View.swift
//  Cravles
//
//  Created by Indah Nurindo on 25/11/2564 BE.
//

import SwiftUI

struct Rain1View: View {
    var colors: [Color] = [Color.pulsatingColor]
    @State private var reflection = ""
    var body: some View {
        ZStack{
            Color.pulsatingColor
                .ignoresSafeArea()
            GeometryReader{ h in
                VStack{
                    ZStack{
                        TextEditor(text: $reflection)
                            .frame(width:h.size.width/1.15, height: h.size.width)
                            .cornerRadius(20)
                            .padding(EdgeInsets(top: h.size.width/5, leading:h.size.width/15, bottom: 0, trailing:h.size.width/15))
                           
                        if reflection.isEmpty {
                            Text("Type here")
                                .padding(.top,h.size.width/8)
                                .padding()
                                .opacity(0.25)
                                .frame(width:h.size.width/1.15, height: h.size.width, alignment: .topLeading)
                                .cornerRadius(20)
                                
                                
                        }
                       
                    }
                }
            }
        }
    }
}

struct Rain1View_Previews: PreviewProvider {
    static var previews: some View {
        Rain1View()
    }
}
