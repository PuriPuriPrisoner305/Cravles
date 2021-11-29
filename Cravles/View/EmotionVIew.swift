//
//  EmotionVIew.swift
//  Cravles
//
//  Created by Ardyansyah Wijaya on 27/11/21.
//

import SwiftUI

struct EmotionVIew: View {
    @State private var emotionLevel: Double = 2
    @State private var emotionIcon = "😊"
    @State private var emotionStatus = "Happy"
    var body: some View {
        ZStack{
            Color.pulsatingColor
                .ignoresSafeArea()
            
            VStack{
                Text("Hi John")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 1)
                Text("How are you feeling?")
                    .font(.title3)
                
                Spacer()
                
                Text(emotionIcon)
                    .font(.largeTitle)
                
                Text(emotionStatus.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .tracking(3)
                    
                    .padding()
                
                Slider(value: $emotionLevel, in: 0...5)
                    .padding(.init(top: 0, leading: 40, bottom: 0, trailing: 40))
                    .accentColor(Color.white)
                
                Spacer()
                Button("Continue"){
                    
                }
                .foregroundColor(Color.pulsatingColor)
                .frame(width: 200, height: 50)
                .background(Color.white)
                .clipShape(Capsule())
                
            }
            .foregroundColor(Color.white)
            .padding(.init(top: 40, leading: 0, bottom: 60, trailing: 0))

        }
    }
}



struct EmotionVIew_Previews: PreviewProvider {
    static var previews: some View {
        EmotionVIew()
    }
}
