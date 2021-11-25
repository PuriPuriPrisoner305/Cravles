//
//  FeelingView.swift
//  Cravles
//
//  Created by Indah Nurindo on 25/11/2564 BE.
//

import SwiftUI

struct FeelingView: View {
    @State var currentValue = 4.0
    var body: some View {
        VStack{
            Image("\(Int(currentValue))")
            Text("\(Int(currentValue))")
            HStack{
                Slider(value: $currentValue,in:0 ... 7)
                    .accentColor(.orange)
                    .padding()
                    
            }
        }
    }
}

struct FeelingView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingView()
    }
}
