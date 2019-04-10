//
//  CourseCardView.swift
//  MVVM Sample
//
//  Created by macbookpro on 10/04/2019.
//  Copyright © 2019 Tristan. All rights reserved.
//

import UIKit
import SDWebImage

class CourseCardView: UIView {
    
    // Thumbnail imageview
    let thumbnail:UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    // Course title label
    let title:UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Font.mainFont.create
        label.textColor = Color.mainTheme.create
        label.textAlignment = .center

        return label
    }()
    
    // Number Of Lessons Label
    let lessons:UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Color.mainTheme.create
        label.font = Font.subFont.create
        label.textAlignment = .center
        
        return label
    }()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(withTitle titleString:String, withLessons lessonString:String, withThumbnail url:URL?) {
        
        title.text = titleString
        lessons.text = lessonString
        thumbnail.sd_setImage(with: url, completed: nil)
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(title)
        addSubview(lessons)
        addSubview(thumbnail)
        
        let views = [
            "title":title,
            "lessons":lessons,
            "thumbnail":thumbnail
        ]
        
        addConstraintsWithVisualFormat(format: "V:|[thumbnail(150)]-20-[title][lessons]", views: views)
        
        addConstraintsWithVisualFormat(format: "H:|[thumbnail]|", views: views)
        addConstraintsWithVisualFormat(format: "H:|[lessons]|", views: views)
        addConstraintsWithVisualFormat(format: "H:|[title]|", views: views)
    }
}
