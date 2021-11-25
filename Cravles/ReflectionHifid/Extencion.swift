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
}
