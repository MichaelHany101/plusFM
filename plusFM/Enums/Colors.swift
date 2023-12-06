//
//  Colors.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import UIKit
import SwiftUI

public enum AppColor {
    
    // MARK: - Cases
    case appBlack
    case appOrange
    case appPink
    case appWhite
    case custom(hex: String)
}

extension AppColor {
    public var value: Color {
        var instanceColor = UIColor.clear
        
        switch self {
        case .appBlack: instanceColor = UIColor.init(Color("AppBlack"))
        case .appOrange: instanceColor = UIColor.init(Color("AppOrange"))
        case .appPink: instanceColor = UIColor.init(Color("AppPink"))
        case .appWhite: instanceColor = UIColor.init(Color("AppWhite"))
        default: instanceColor = UIColor.clear
        }
        return Color.init(instanceColor)
    }
}
