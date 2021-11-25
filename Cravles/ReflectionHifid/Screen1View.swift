//
//  Screen1View.swift
//  Cravles
//
//  Created by Indah Nurindo on 25/11/2564 BE.
//

import SwiftUI

struct Screen1View: View {
    var colors: [Color] = [Color.pulsatingColor]
    @State var yOffset: CGFloat = 38.75
    let range: ClosedRange<CGFloat> = -120 ... 120
    
    var body: some View {
        ZStack{
            Color.pulsatingColor
                .ignoresSafeArea()
            
            VStack{
                Text("How are you feeling?")
                    .font(.system(size: 24,weight: .bold))
                
                Smiley(yOffset: yOffset)
                    .stroke(Color.black, lineWidth: 20)
                    .frame(height: 500)
                    .cornerRadius(10)
                    
                
                Slider(value: $yOffset, in:range )
                Button(action:{}){
                    Text("Continue")
                        .foregroundColor(Color.pulsatingColor)
                        
                }.padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .padding(.top,16)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea()
    }
}
struct Smiley : Shape {
    let yOffset: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let spacing: CGFloat = 150
        //matakiri
        path.addPath(getEye(_path: path, rect: rect))
        path = path.applying(.init(scaleX: -1, y: 1))
        path = path.applying(.init(translationX: rect.maxX - spacing, y: 0))
        
        //matakanan
        path.addPath(getEye(_path: path, rect: rect))
        path = path.applying(.init(translationX: spacing / 2, y: 0))
           
        //anim mata
        path = path.applying(.init(translationX:0, y: -150))
        path.addPath(getMouth(_path: path, rect: rect))
        
        return path
    }
    func getMouth(_path: Path, rect: CGRect) -> Path {
        var path = _path
        let startPoint = CGPoint(x: rect.minX+20, y: rect.midY)
        let endPoint = CGPoint(x:rect.maxX-10, y: rect.midY)
        
        let controlPtn1 = CGPoint(x: startPoint.x + 8, y: rect.midY + yOffset)
        let controlPtn2 = CGPoint(x: endPoint.x + 8, y: rect.midY + yOffset)
        
        path.move(to: startPoint)
        
        path.addCurve(to: endPoint, control1: controlPtn1, control2: controlPtn2)
        return path
    }
    
    func getEye(_path: Path, rect: CGRect) -> Path {
        var path = _path
        let startPoint = CGPoint(x: rect.midX - 50, y: rect.midY)
        let bottomPoint = CGPoint(x: startPoint.x+50, y: startPoint.y+50)
        let controlPtn1 = CGPoint(x: startPoint.x, y: bottomPoint.y)
        let rightPtn = CGPoint(x: startPoint.x+100, y: startPoint.y-30)
        let controlPtn2 = CGPoint(x:rightPtn.x, y:bottomPoint.y)

        path.move(to:startPoint)
        path.addQuadCurve(to: bottomPoint, control: controlPtn1)
        path.addQuadCurve(to: rightPtn, control: controlPtn2)

        let offset: CGFloat = yOffset/5
        let controlPtn3 = CGPoint(x: rightPtn.x - 5, y: rightPtn.y-offset)
        let controlPtn4 = CGPoint(x: startPoint.x+5, y: rightPtn.y-offset)

        path.addCurve(to: startPoint, control1: controlPtn3, control2: controlPtn4)
        
            
        return path
    }
    
}

struct Screen1View_Previews: PreviewProvider {
    static var previews: some View {
        Screen1View()
    }
}
