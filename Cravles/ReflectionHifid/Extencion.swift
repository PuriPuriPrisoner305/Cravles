//
//  Extencion.swift
//  Cravles
//
//  Created by Indah Nurindo on 25/11/2564 BE.
//

import Foundation
import SwiftUI


extension Color {
    static func rgb(r: Double,g:Double, b:Double)-> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    
    static let pulsatingColor = Color.rgb(r: 235, g: 153, b: 140).opacity(1)
    static let textFieldColor = Color.rgb(r: 220, g: 138, b: 124).opacity(1)
}
extension Date {
        func formatDate() -> String {
                let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd, MMM yyyy"
            return dateFormatter.string(from: self)
        }
    func formatDay() -> String {
            let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    func formatDateMonth() -> String {
            let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    func offset(from date: Date) -> String {
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        return ""
    }
    
}
//
//struct CustomCell: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(entity: Reflection.entity(), sortDescriptors:
//                    [NSSortDescriptor(keyPath: \Reflection.monthReflection, ascending: false)]) var rains: FetchedResults<Reflection>
//    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
//    var colors: [Color] = [Color.pulsatingColor, Color.textFieldColor]
//    @StateObject var vm = RainCoreData()
////    @StateObject var vm = ReflectionViewModel()
//    var body: some View {
//        GeometryReader{ h in
//                VStack{
//                    ZStack{
//                   Rectangle()
//                            .frame(width:UIScreen.main.bounds.width-35, height: 100)
//                            .cornerRadius(10)
//                            .foregroundColor(Color.white)
//                            .padding()
//                            .shadow(radius: 5)
//                    HStack{
//
//                        ZStack(alignment:.center){
//                            Rectangle()
//                                .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.width/5.5)
//                                .cornerRadius(5)
//                                .foregroundColor(Color.textFieldColor)
//                                .padding(.leading,0)
//                            VStack(alignment:.center){
//                                Text(vm.reflection1 ?? "14")
//                                    .foregroundColor(Color.white)
//                                Text(vm.reflection1 ?? "Nov")
//                                    .foregroundColor(Color.white)
//                            } .padding(.leading,4)
//
//                        }
//
//                        VStack(alignment: .leading){
//                            Text(vm.reflection1 ?? "Suspended")
//
//                            Text(vm.reflection1 ?? "you just completed i 0f 3 stages lest's finish it")
//                                .font(.system(size: 9))
//                        }
//                        .padding()
//
//                        Image(systemName: "minus.circle")
//
//                    }
//                    }
//                }
//        }
//
//    }
//}
