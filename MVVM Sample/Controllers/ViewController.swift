//
//  ViewController.swift
//  MVVM Sample
//
//  Created by macbookpro on 10/04/2019.
//  Copyright © 2019 Tristan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let thisCourseView:CourseCardView = {
        
        let view = CourseCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiCall()
    }
    
    func apiCall() {
        
        Client.shared.get { course in
            
            if let courseViewModel = course {
                
                self.thisCourseView.display(withTitle: courseViewModel.name,
                                            withLessons: courseViewModel.lessonLabel,
                                            withThumbnail: courseViewModel.imageURL)
            }
        }
    }
    
    // MARK: - Layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.backgroundColor = .white
        
        view.addSubview(thisCourseView)
        
        let views = [
            "thisCourseView":thisCourseView
        ]
        
        view.addConstraintsWithVisualFormat(format: "V:|[thisCourseView]|", views: views)
        view.addConstraintsWithVisualFormat(format: "H:|[thisCourseView]|", views: views)
    }


}

