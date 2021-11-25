//
//  MainScreen.swift
//  Cravles
//
//  Created by Ardyansyah Wijaya on 24/11/21.
//

import SwiftUI

struct MainScreen: View {
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
                            
                        Text("John Smith")
                            .foregroundColor(Color.white)
                            .font(.title)
                            .fontWeight(.black)
                            .padding(.leading, 25)
                            .frame(width: geo.size.width, alignment: .leading)
                    }
                    .frame(width: geo.size.width, height: geo.size.height * (1/3), alignment: .leading)
                    
                    //Bagian Putih
                    VStack(alignment: .center){
                        Text("Exercise for you")
                            .frame(width: geo.size.width, alignment: .leading)
                            .padding(.leading, 90)
                        
                        // Exercise
                        HStack(spacing: 10){
                            Image("breathee")
                                .resizable()
                                .frame(width: 90, height: 120)
                            
                            VStack(alignment: .leading){
                                Text("Breathing")
                                    .fontWeight(.medium)

                                Text("Focus your attention on your breathing and the way it feels on each inhale and exhale")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(20)
                        .frame(width: geo.size.width - 50)
                        .background(Color.white)
                        .shadow(radius: 10)

                        HStack(spacing: 10){
                            Image("breathee")
                                .resizable()
                                .frame(width: 90, height: 120)
                            
                            VStack(alignment: .leading){
                                Text("Breathing")
                                    .fontWeight(.medium)

                                Text("Focus your attention on your breathing and the way it feels on each inhale and exhale")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(20)
                        .frame(width: geo.size.width - 50)
                        .background(Color.white)
                        .shadow(radius: 10)

                        
                        
                    }
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
        MainScreen()
    }
}

extension Color {
    static func rgb(r: Double,g:Double, b:Double)-> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    
    static let pulsatingColor = Color.rgb(r: 235, g: 153, b: 140).opacity(1)
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
