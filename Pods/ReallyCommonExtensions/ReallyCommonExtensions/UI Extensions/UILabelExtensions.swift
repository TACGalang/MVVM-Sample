//
//  UILabelExtensions.swift
//  Coach2Grow
//
//  Created by Tristan Galang on 16/08/2018.
//  Copyright © 2018 Binary Digital. All rights reserved.
//

import UIKit

public extension UILabel {
    
    /**
     Add character spacing.
     
     - parameter value: Distance between the characters, default value is 1.15
     */
    public func addCharactersSpacing(_ value: CGFloat = 1.15) {
        
        let selfString = text ?? ""
        
        if let attributedString = attributedText?.mutableCopy() as? NSMutableAttributedString {
            
            let kernAttr: [NSAttributedString.Key : Any] = [.kern: value]
            attributedString.addAttributes(kernAttr, range: NSRange(location: 0, length: selfString.count))
            attributedText = attributedString
        }
    }
}

