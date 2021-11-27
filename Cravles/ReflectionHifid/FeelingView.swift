//
//  FeelingView.swift
//  Cravles
//
//  Created by Indah Nurindo on 25/11/2564 BE.
//

import SwiftUI

struct FeelingView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var currentValue = 4.0
    @State private var reflection = ""
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        ZStack{
            GeometryReader{ h in
//                Image("\(Int(currentValue))")
                VStack{
                    Image("\(Int(currentValue))")
                        .frame(width: h.size.width/5, height: h.size.width/5, alignment: .center)
                        .padding(.top,h.size.width/2)
                        .padding()
                    Slider(value: $currentValue,in:0 ... 7)
                        .accentColor(.orange)
                        .padding()
                        .padding(.top,h.size.width/5)
                    Button("Save") {
                        let reflection = Reflection(context: moc)
                        reflection.reflection1 = self.reflection
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(reflection.isEmpty)
                    .frame(width: h.size.width/2, height: h.size.width/7, alignment: .center)
                        .font(Font.system(.title2, design: .rounded))
                        .background(Color.white)
                        .cornerRadius(50)
                        .foregroundColor(Color.pulsatingColor)
                        .shadow(color: .black, radius: 4)
                        .padding(.top,h.size.width/2)
                        
                }
            }
        }
    }
}

struct FeelingView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingView()
    }
}
