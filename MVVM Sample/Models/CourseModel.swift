//
//  CourseModel.swift
//  MVVM Sample
//
//  Created by macbookpro on 10/04/2019.
//  Copyright © 2019 Tristan. All rights reserved.
//

import Foundation

struct CourseModel:Decodable {
    
    let id:Int
    let name:String
    let imageURL:String
    let numberOfLessons:Int
    
    private enum CodingKeys:String, CodingKey {
        
        case id = "id"
        case name = "name"
        case imageURL = "imageUrl"
        case numberOfLessons = "number_of_lessons"
    }
}
