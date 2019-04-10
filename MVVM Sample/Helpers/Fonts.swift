//
//  FOnts.swift
//  poc-agency
//
//  Created by macbookpro on 21/03/2019.
//  Copyright © 2019 impero. All rights reserved.
//

import UIKit

enum Font {
    
    /// name: "Helvetica", size: 20.0
    case mainFont
    /// name: "Helvetica", size: 13.0
    case subFont
    
    var create:UIFont {
        
        switch self {
            
        case .mainFont:
            return UIFont(name: "Helvetica", size: 20.0)!
        case .subFont:
            return UIFont(name: "Helvetica", size: 13.0)!
        }
    }
}
