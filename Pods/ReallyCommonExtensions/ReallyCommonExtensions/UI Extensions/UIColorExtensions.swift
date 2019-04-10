//
//  Color.swift
//
//  Created by Tristan Galang on 02/03/2018.
//  Copyright © 2018 Binary Digital. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /**
     Creates an UIColor from a HEX String in format.
     ## Example Format:
     - "#36363636"
     */
    public convenience init(hexString: String) {
        
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner          = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    /**
     Creates a UIColor based on the RGB format without dividing it to 255.0
     ## Example Parameter:
     - (red: 0, green: 0, blue: 0)
     */
    public convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /**
     Modified a saturation and brightness of a UIColor .
     ## Example Parameter:
     - (withNewSaturation saturation: 0, brightnest: 0)
     */
    public func modified(withNewSaturation saturation: CGFloat, brightnest: CGFloat) -> UIColor {
        
        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrigthness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0
        
        if self.getHue(&currentHue, saturation: &currentSaturation, brightness: &currentBrigthness, alpha: &currentAlpha){
            return UIColor(hue: currentHue,
                           saturation:  saturation,
                           brightness: brightnest,
                           alpha: currentAlpha)
        } else {
            return self
        }
    }
}
