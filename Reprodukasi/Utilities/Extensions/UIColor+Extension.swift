//
//  UIColor+Extension.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 24/06/22.
//

import UIKit

extension UIColor {
    static let PRIMARY_RED = UIColor(named: "PrimaryRed")
    
    static let DISABLED_BUTTON = UIColor(named: "DisabledButton")
    static let DISABLED_TEXT = UIColor(named: "DisabledText")
    
    static let SUCCESS_GREEN = UIColor(named: "Success")
    
    convenience init(hex: String, alpha: CGFloat = 1) {
        assert(hex[hex.startIndex] == "#", "Expected hex string of format #RRGGBB")
        
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1  // skip #
        
        var rgb: UInt32 = 0
        scanner.scanHexInt32(&rgb)
        
        self.init(
            red:   CGFloat((rgb & 0xFF0000) >> 16)/255.0,
            green: CGFloat((rgb &   0xFF00) >>  8)/255.0,
            blue:  CGFloat((rgb &     0xFF)      )/255.0,
            alpha: alpha)
    }
}
