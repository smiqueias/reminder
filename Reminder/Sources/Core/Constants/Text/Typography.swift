//
//  Text.swift
//  Reminder
//
//  Created by Saulo Nascimento on 20/04/25.
//


import Foundation
import UIKit

public struct Typography {
    
    static private let nunitoSansExtraBold: String = "NunitoSans-12ptExtraLight_Bold"
    static private let nunitoSansRegular: String = "NunitoSans-12ptExtraLight_Regular"
    static private let nunitoSansSemiBold: String = "NunitoSans-12ptExtraLight_SemiBold"
    
    static let titleLarge =  UIFont(name: nunitoSansExtraBold, size: 24)
    static let heading =  UIFont(name: nunitoSansExtraBold, size: 20)
    static let subHeading = UIFont(name: nunitoSansExtraBold, size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .heavy)
    static let input = UIFont(name: nunitoSansRegular, size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .heavy)
    static let label = UIFont(name: nunitoSansSemiBold, size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .heavy)
    static let body = UIFont(name: nunitoSansRegular, size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .heavy)
    static let tag = UIFont(name: nunitoSansRegular, size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .heavy)
}
