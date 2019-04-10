//
//  Color.swift
//  poc-agency
//
//  Created by macbookpro on 21/03/2019.
//  Copyright © 2019 impero. All rights reserved.
//

import Foundation
import ReallyCommonExtensions

enum Color {
    
    case mainTheme

    var create:UIColor  {
        
        switch self {
        case .mainTheme:
            return UIColor(hexString: "0083AA")
        }
    }
}
