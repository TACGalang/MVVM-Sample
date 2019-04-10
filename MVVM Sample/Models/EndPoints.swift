//
//  EndPoints.swift
//  MVVM Sample
//
//  Created by macbookpro on 10/04/2019.
//  Copyright © 2019 Tristan. All rights reserved.
//

import Foundation

enum EndPoints:String {
    
    case jsonDecodableCourse = "jsondecodable/course"

    func get(urlWith baseURL:String) -> String {
        
        return "\(baseURL)\(self.rawValue)"
    }
    
    func get(urlWith baseURL:String, andParameters params:String?) -> String {
        
        return "\(baseURL)\(self.rawValue)/\(params ?? "")"
    }
}
