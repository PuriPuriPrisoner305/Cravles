//
//  MainScreenRow.swift
//  Cravles
//
//  Created by Yani . on 09/12/21.
//

import SwiftUI

struct MainScreenRow: View {
    var audioData : Audio
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack(spacing: 10){
                    Image(uiImage: audioData.artwork)
                        .resizable()
                        .frame(width: 90, height: 100)

                    VStack(alignment: .leading){
                        Text(audioData.title)
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(Color.black)

                        Text(audioData.exerciseDesc)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)

                        VStack(alignment: .leading){
                            Text("Estimated time")
                            Text("\(audioData.exerciseDuration) min")
                        }
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    }

                }
                .padding(20)
                .frame(width: geo.size.width - 50)
                .background(Color.white
                    .shadow(radius: 10)
                )
            }
        }
    }
}

struct MainScreenRow_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenRow(audioData: Audio.audios[0])
    }
}
