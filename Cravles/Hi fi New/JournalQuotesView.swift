//
//  JournalQuotesView.swift
//  Cravles
//
//  Created by Indah Nurindo on 30/11/2564 BE.
//

import SwiftUI

struct JournalQuotesView: View {
    @Environment(\.presentationMode) var presentationMode
    let quotesList = ["quotes 1 when you feel sad, it's okay. it's not the end of the world. -Mac Miller","quotes 2", "qoutes 3"]
    let randomQuotes : String
    init() {
        self.randomQuotes = quotesList.randomElement()!
    }
  
    var body: some View {
        GeometryReader{ h in
            ZStack{
                Color.pulsatingColor
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "multiply.square.fill")
                                .resizable()
                                .frame(width: h.size.width/10, height: h.size.width/10)
                                
                        }
                    }
                    
                    //                Text("\(randomQuotes)")
                                    Text("quotes 1 when you feel sad, it's okay. it's not the end of the world. -Mac Miller")
                        .font(.system(size: h.size.width/12, weight: .bold, design: .default))
                                        .foregroundColor(Color.white)
                                        .padding()
                                    Rectangle()
                        .frame(width: h.size.width/1.2, height: 2, alignment: .center)
                        .foregroundColor(Color.white)
                        .opacity(0.5)
                        .padding(10)

                }
                
            }
        }
    }
}

struct JournalQuotesView_Previews: PreviewProvider {
    static var previews: some View {
        JournalQuotesView()
    }
}
