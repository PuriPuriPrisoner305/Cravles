//
//  Extension.swift
//  Cravles
//
//  Created by Indah Nurindo on 24/11/2564 BE.
//

import SwiftUI
import Foundation

struct VisualBarView: View {
    var value: CGFloat
    let numberOfSamples: Int = 30
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
                .frame(width: UIScreen.main.bounds.width - (CGFloat(numberOfSamples)*10/CGFloat(numberOfSamples)*10), height: value)
        }
    }
}
