//
//  Colors.swift
//  Reminder
//
//  Created by Saulo Nascimento on 20/04/25.
//

import Foundation
import UIKit

public struct Colors {
    static let primaryRedBase = UIColor(
        red: 192/255,
        green: 38/255,
        blue: 54/255,
        alpha: 1
    )
    static let secondaryRedBase = UIColor(
        red: 235/255,
        green: 60/255,
        blue: 77/255,
        alpha: 1
    )
    static let primaryBlueBase = UIColor(
        red: 51/255.0,
        green: 79/255.0,
        blue: 220/255.0,
        alpha: 1.0
    )
    static let secondaryBlueBase = UIColor(
        red: 110/255,
        green: 131/255,
        blue: 236/255,
        alpha: 1
    )
    
    // Grayscale
    static let gray100 = UIColor(
        red: 23/255,
        green: 34/255,
        blue: 43/255,
        alpha: 1
    )  // #17222B
    static let gray200 = UIColor(
        red: 41/255,
        green: 60/255,
        blue: 76/255,
        alpha: 1
    )  // #293C4C
    static let gray300 = UIColor(
        red: 77/255,
        green: 112/255,
        blue: 143/255,
        alpha: 1
    )  // #4D708F
    static let gray400 = UIColor(
        red: 162/255,
        green: 185/255,
        blue: 205/255,
        alpha: 1
    )  // #A2B9CD
    static let gray500 = UIColor(
        red: 202/255,
        green: 215/255,
        blue: 226/255,
        alpha: 1
    )  // #CAD7E2
    static let gray600 = UIColor(
        red: 215/255,
        green: 225/255,
        blue: 234/255,
        alpha: 1
    )  // #D7E1EA
    static let gray700 = UIColor(
        red: 232/255,
        green: 238/255,
        blue: 243/255,
        alpha: 1
    )  // #E8EEF3
    static let gray800 = UIColor(
        red: 248/255,
        green: 250/255,
        blue: 251/255,
        alpha: 1
    )  // #F8FAFB
    
    static let loaderBackground = UIColor.black.withAlphaComponent(0.5)
}
