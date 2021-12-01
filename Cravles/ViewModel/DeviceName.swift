//
//  DeviceName.swift
//  Cravles
//
//  Created by Ardyansyah Wijaya on 01/12/21.
//

import Foundation
import SwiftUI

class DeviceName{
    var getDeviceName = UIDevice.current.name
    var deviceName: String {
        return getDeviceName.firstUppercased
    }
}

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
