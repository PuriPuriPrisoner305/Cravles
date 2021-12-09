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
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(radius: 5)

                VStack {
                    HStack {
                        Image(uiImage: audioData.artwork)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 125)

                        VStack(alignment: .leading){
                            Text(audioData.title)
                                .font(.body)
                                .fontWeight(.medium)
                                .padding(.bottom, 5)
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
                    .padding(16)
//                    .background(Color.white
//                        .shadow(radius: 10)
//                    )
                }
            }
            .frame(width: geo.size.width * 0.90, height: 150, alignment: .center)
            .padding(20)
        }

    }

}

struct MainScreenRow_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenRow(audioData: Audio.audios[0])
    }
}
