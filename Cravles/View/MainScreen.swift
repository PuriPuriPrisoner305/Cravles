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
                    .frame(width: geo.size.width, height: geo.size.height * (0.9/3), alignment: .leading)
                    
                    //Bagian Putih
                    VStack(alignment: .leading){
                        Text("Exercise for you")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.top, 20)
                            .padding(.leading, 22)
                            .frame(width: geo.size.width, alignment: .leading)

                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 2)
                            .padding(.horizontal, 20)


//                        VStack {
                            //Exercise
                            ForEach(Audio.audios) { audio in
                                NavigationLink(destination: ExerciseView(audioData: audio)) {
                                    MainScreenRow(audioData: audio)
                                }
                            }
//                        }
                        
                        
                    }
                    .padding(.bottom, 120)
                    .frame(width: geo.size.width, height: geo.size.height * (2.1/3), alignment: .leading)
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
