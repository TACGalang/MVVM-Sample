//
//  UIViewExtensions.swift
// 
//  Created by Tristan Galang on 06/03/2018.
//  Copyright © 2018 Binary Digital. All rights reserved.
//

import UIKit

public enum GradientDirection {
    case leftToRight
    case rightToLeft
    case topToBottom
    case bottomToTop
    case custom
}

public extension UIView {
    
    /**
     Create a gradient color from the view.
     
     - parameter firstColor: The first UIColor
     - parameter secondColor: The second UIColor
     - parameter direction: Direction of the gradient, example is leftToRight.
     */
    public func create(gradientBackgroundFromFirstColor firstColor: UIColor,
                toSecondColor secondColor: UIColor,
                inDirection direction: GradientDirection,
                withCustomStartPoint startPoint:CGPoint? = nil,
                withCustomEndPoint endPoint:CGPoint? = nil) {
        
        self.layer.sublayers?.first?.removeFromSuperlayer()
        
        let gradient = CAGradientLayer()
        
        gradient.frame = self.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        
        switch direction {
        case .leftToRight:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightToLeft:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .bottomToTop:
            gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        case .custom:
            
            if let startingPoint = startPoint, let endingPoint = endPoint {
                
                gradient.startPoint = startingPoint
                gradient.endPoint = endingPoint
            } else {
                
                if startPoint == nil {
                    
                    print("Error: Custom starting point is nil")
                }
                
                if endPoint == nil {
                    
                    print("Error: Custom ending point is nil")
                }
                
                return
            }
        default:
            break
        }
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    /**
     For cleaner and readable visual format.
     
     - parameter format: String where you put your visual rules.
     - parameter views: Dictionary of views.
     - parameter metrics: Dictionary of NSNumbers.
     */
    public func addConstraintsWithVisualFormat(format: String, views: [String:Any], metrics: [String:Any]? = nil) {
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: views))
    }
}
