//
//  MainScreen.swift
//  Cravles
//
//  Created by Ardyansyah Wijaya on 24/11/21.
//

import SwiftUI

struct MainScreen: View {
    var deviceName = DeviceName()
    var audioData : Audio
//    var colors: [Color] = [Color.pulsatingColor]
    var body: some View {
        VStack{
            GeometryReader { geo in
                VStack{
                    VStack{
                        Text("Good Morning,")
                            .foregroundColor(Color.white)
                            .font(.title2)
                            .padding(.leading, 25)
                            .frame(width: geo.size.width, alignment: .leading)
                            
                        Text("\(deviceName.deviceName)")
                            .foregroundColor(Color.white)
                            .font(.title)
                            .fontWeight(.black)
                            .padding(.leading, 25)
                            .frame(width: geo.size.width, alignment: .leading)
                    }
                    .frame(width: geo.size.width, height: geo.size.height * (1/3), alignment: .leading)
                    
                    //Bagian Putih
                    VStack(alignment: .leading){
                        Text("Exercise for you")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.leading, 22)
                            .frame(width: geo.size.width, alignment: .leading)

                        VStack {
                            ForEach(Audio.audios) { audio in
                                NavigationLink(destination: ExerciseView()) {
                                    MainScreenRow(audioData: audioData)
                                }
                            }
                        }

//                        // Exercise
//                        VStack(spacing: 20){
//
//                            NavigationLink(destination: ExerciseView()) {
//                                HStack(spacing: 10){
//                                    Image("breathee")
//                                        .resizable()
//                                        .frame(width: 90, height: 100)
//
//                                    VStack(alignment: .leading){
//                                        Text("Breathing")
//                                            .font(.body)
//                                            .fontWeight(.medium)
//                                            .foregroundColor(Color.black)
//
//                                        Text("Focus your attention on your breathing and the way it feels on each inhale and exhale")
//                                            .font(.caption)
//                                            .foregroundColor(.gray)
//                                            .multilineTextAlignment(.leading)
//
//                                        VStack(alignment: .leading){
//                                            Text("Estimated time")
//                                            Text("03.00 min")
//                                        }
//                                        .font(.footnote)
//                                        .foregroundColor(.gray)
//                                        .padding(.top, 5)
//
//
//                                    }
//
//                                }
//                                .padding(20)
//                                .frame(width: geo.size.width - 50)
//                                .background(Color.white
//                                    .shadow(radius: 10)
//
//                                )
//                            }
//
//                            NavigationLink(destination: EmotionVIew()) {
//                                HStack(spacing: 10){
//                                    Image("breathee")
//                                        .resizable()
//                                        .frame(width: 90, height: 100)
//
//                                    VStack(alignment: .leading){
//                                        Text("Breathing")
//                                            .font(.body)
//                                            .fontWeight(.medium)
//                                            .foregroundColor(Color.black)
//
//                                        Text("Focus your attention on your breathing and the way it feels on each inhale and exhale")
//                                            .font(.caption)
//                                            .foregroundColor(.gray)
//                                            .multilineTextAlignment(.leading)
//
//                                        VStack(alignment: .leading){
//                                            Text("Estimated time")
//                                            Text("03.00 min")
//                                        }
//                                        .font(.footnote)
//                                        .foregroundColor(.gray)
//                                        .padding(.top, 5)
//
//
//                                    }
//
//                                }
//                                .padding(20)
//                                .frame(width: geo.size.width - 50)
//                                .background(Color.white
//                                    .shadow(radius: 10)
//
//                                )
//                            }
//
//
//                        }
//                        .frame(width: geo.size.width)
                        
                        

                        
                        
                    }
                    .padding(.bottom, 120)
                    .frame(width: geo.size.width, height: geo.size.height * (2/3), alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(radius:20, corners: [.topLeft, .topRight])
                    
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                
            }
    
            
        }
        .background{
            VStack{
                Color.pulsatingColor
//                Color.white
            }
            
            
        }

    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(audioData: Audio.audios[0])
    }
}


//step 1 -- Create a shape view which can give shape
struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//step 2 - embed shape in viewModifier to help use with ease
struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
//step 3 - crate a polymorphic view with same name as swiftUI's cornerRadius
extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
