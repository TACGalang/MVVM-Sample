//
//  CourseViewModel.swift
//  MVVM Sample
//
//  Created by macbookpro on 10/04/2019.
//  Copyright © 2019 Tristan. All rights reserved.
//

import Foundation

struct CourseViewModel {
    
    let id:Int
    let name:String
    let imageURL:URL?
    let numberOflessons:Int
    
    // Basic importance of having a ViewModel, making a model display ready.
    var lessonLabel:String {
        
        if numberOflessons > 0 {
            
            return "Number of Lessons: \(numberOflessons)"
        } else {
            
            return "This course has no lesson yet."
        }
    }
    
    init(withModel model:CourseModel) {
        
        self.id = model.id
        self.name = model.name
        self.imageURL = URL(string: model.imageURL)
        self.numberOflessons = model.numberOfLessons
    }
}
