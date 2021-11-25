//
//  Reflection2View.swift
//  Cravles
//
//  Created by Indah Nurindo on 25/11/2564 BE.
//

import SwiftUI

struct Reflection2View: View {
    var body: some View {
        ZStack{
            GeometryReader { h in
                VStack{
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: h.size.width/10, height: h.size.width/10)
                    Rectangle()
                        .frame(width: h.size.width/90, height: h.size.width/4, alignment: .leading)
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: h.size.width/10, height: h.size.width/10)
                    Rectangle()
                        .frame(width: h.size.width/90, height: h.size.width/4, alignment: .leading)
                    
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: h.size.width/10, height: h.size.width/10)
                    
                }.padding()
                HStack{
                    
                }
                
            }
           
        }
    }
}

struct Reflection2View_Previews: PreviewProvider {
    static var previews: some View {
        Reflection2View()
    }
}
