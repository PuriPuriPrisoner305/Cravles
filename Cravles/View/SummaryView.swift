//
//  SummaryView.swift
//  Cravles
//
//  Created by Ardyansyah Wijaya on 27/11/21.
//

import SwiftUI

struct SummaryView: View {
    @State private var textField = "Test"
    var deviceName: DeviceName
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("\(deviceName.deviceName)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,1)
                    
                    Text("How are you feeling?")
                        .font(.title3)
                }
                Spacer()
                
                Image("breathee")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(120)
                
                
            }
            .frame(width: .infinity)
            .padding(.init(top: 0, leading: 35, bottom: 0, trailing: 35))
            
            //BAR PINK
            HStack{
                ForEach(0..<3) {
                    Text("text \($0)")
                        .frame(width: 100, height: 90)
                        .background(Color.pulsatingColor)
                        .cornerRadius(12)
                }
            }
            
            //Title Subtitle
            VStack(alignment:.leading){
                Text("Title")
                Text("Subtitle")
                    .font(.footnote)
                TextField("Test", text:$textField)
            }
            .padding(.leading, 35)
            
            
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(deviceName: DeviceName())
    }
}
