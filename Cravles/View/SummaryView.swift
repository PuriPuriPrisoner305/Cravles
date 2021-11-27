//
//  SummaryView.swift
//  Cravles
//
//  Created by Ardyansyah Wijaya on 27/11/21.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("John Smith")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,1)
                    Text("How are you feeling?")
                        .font(.title3)
                }
                
                Image("breathee")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(120)
                
                
            }
            
            HStack{
                Text("text")
                    .frame(width: 100, height: 90)
                    .background(Color.pulsatingColor)
                    .cornerRadius(12)
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
