//
//  Fonts.swift
//
//  Created by Tristan Galang on 05/03/2018.
//  Copyright © 2018 Binary Digital. All rights reserved.
//

import UIKit

public extension UIFont {
        
    /**
     Convinience initializer with regular size and aditional custom size for iPad.
     ## Example Parameter:
     - (fontName: "StringFont", regularSize: 16.0, optionalSize: 32.0)
     */
    public convenience init(withFontName fontName:String,
                     andRegularSize regularSize:CGFloat,
                     withOptionalSizeToAdd optionalSize:CGFloat = 5.0) {
        
        var finalSize = regularSize
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            finalSize += optionalSize
        }
        
        self.init(name: fontName, size: finalSize)!
    }
}
