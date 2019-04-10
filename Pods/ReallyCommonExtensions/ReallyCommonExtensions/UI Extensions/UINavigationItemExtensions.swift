//
//  UINavigationItemExtensions.swift
//
//  Created by Tristan Galang on 20/03/2018.
//  Copyright © 2018 Binary Digital. All rights reserved.
//

import UIKit

public extension UINavigationItem {

    /**
     Create a title logo from navigation bar with custom icon.
     
     - parameter customIcon: UIImage of the title logo.
     */
    func make(titleWithCustomIcon customIcon:UIImage) {
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        let imageView = UIImageView(frame: logoContainer.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.image = customIcon
        logoContainer.addSubview(imageView)
        
        self.titleView = logoContainer
    }
    
    /**
     Make side menu button.
     
     - parameter target: Optional target, can be self.
     - parameter customIcon: Optional UIImage for button.
     - parameter defaultPosition: Default position is true where is located from the left side of navigation bar.
     - parameter selector: Optional selector where the actions take place for those who use it.
     */
    public func make(sideMenuButtonWithTarget target:Any?,
              withCustomIcon customIcon:UIImage? = nil,
              isDefaultPosition defaultPosition:Bool = true,
              andSelector selector:Selector?) {
        
        var sideMenuButton = UIBarButtonItem()
        
        if let icon = customIcon {
            
            sideMenuButton = UIBarButtonItem(title: nil, style: .plain, target: target, action: selector)
            sideMenuButton.image = icon.withRenderingMode(.alwaysTemplate)
        } else {
            
            sideMenuButton = UIBarButtonItem(title: "Menu", style: .plain, target: target, action: selector)
        }
        
        set(button: sideMenuButton, isDefault: defaultPosition)
    }
    
    /**
     Make a search button.
     
     - parameter target: Optional target, can be self.
     - parameter customIcon: Optional UIImage for button, default is the search icon provided by Apple.
     - parameter defaultPosition: Default position is true where is located from the left side of navigation bar.
     - parameter selector: Optional selector where the actions take place for those who use it.
     */
    public func make(searchButtonItemWithTarget target: Any,
              withCustomIcon customIcon: UIImage? = nil,
              isDefaultPosition defaultPosition: Bool = true,
              andSelector selector:Selector?) {
        
        var searchButtonItem = UIBarButtonItem()
        
        if let icon = customIcon {
            
            searchButtonItem = UIBarButtonItem(title: nil, style: .plain, target: target, action: selector)
            searchButtonItem.image = icon.withRenderingMode(.alwaysTemplate)
        } else {
            
            searchButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: target, action: selector)
        }
        
        set(button: searchButtonItem, isDefault: defaultPosition)
    }
    
    /**
     Make an action button.
     
     - parameter target: Optional target, can be self.
     - parameter customIcon: Optional UIImage for button, default is the action icon provided by Apple.
     - parameter defaultPosition: Default position is true where is located from the left side of navigation bar.
     - parameter selector: Optional selector where the actions take place for those who use it.
     */
    public func make(actionButtonItemWithTarget target: Any,
              withCustomIcon customIcon: UIImage? = nil,
              isDefaultPosition defaultPosition:Bool = true,
              andSelector selector:Selector?) {
        
        var actionButtonItem = UIBarButtonItem()
        
        if let icon = customIcon {
            
            actionButtonItem = UIBarButtonItem(title: nil, style: .plain, target: target, action: selector)
            actionButtonItem.image = icon.withRenderingMode(.alwaysTemplate)
        } else {
            
            actionButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: target, action: selector)
        }
        
        set(button: actionButtonItem, isDefault: defaultPosition)
    }
    
    /**
     Make a done button.
     
     - parameter target: Optional target, can be self.
     - parameter customIcon: Optional UIImage for button, default is the save icon provided by Apple.
     - parameter defaultPosition: Default position is true where is located from the left side of navigation bar.
     - parameter selector: Optional selector where the actions take place for those who use it.
     */
    public func make(doneButtonItemWithTarget target:Any?,
              withCustomIcon customIcon:UIImage? = nil,
              isDefaultPosition defaultPosition:Bool = true,
              andSelector selector: Selector?) {
        
        var doneButtonItem = UIBarButtonItem()
        
        if let icon = customIcon {
            
            doneButtonItem = UIBarButtonItem(title: nil, style: .plain, target: target, action: selector)
            doneButtonItem.image = icon.withRenderingMode(.alwaysTemplate)
        } else {
            
            doneButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: target, action: selector)
        }
        
        set(button: doneButtonItem, isDefault: defaultPosition)
    }
    
    /**
     Make cancel button.
     
     - parameter target: Optional target, can be self.
     - parameter customIcon: Optional UIImage for button, default is the cancel icon provided by Apple.
     - parameter defaultPosition: Default position is true where is located from the left side of navigation bar.
     - parameter selector: Optional selector where the actions take place for those who use it.
     */
    public func make(cancelButtonItemWithTarget target:Any?,
              withCistomIcon customIcon:UIImage? = nil,
              isDefaultPosition defaultPosition: Bool = true,
              andSelector selector:Selector?) {
        
        var cancelButtonItem = UIBarButtonItem()
        
        if let icon = customIcon {
            
            cancelButtonItem = UIBarButtonItem(title: nil, style: .plain, target: target, action: selector)
            cancelButtonItem.image = icon.withRenderingMode(.alwaysTemplate)
        } else {
            
            cancelButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: target, action: selector)
        }
        
        set(button: cancelButtonItem, isDefault: defaultPosition)
    }
    
    /**
     Make a logout button. Custom icon is optional. Default position is left side.
     
     - parameter target: Optional target, can be self.
     - parameter customIcon: Optional UIImage for button, default is labeled "Logout".
     - parameter defaultPosition: Default position is true where is located from the left side of navigation bar.
     - parameter selector: Optional selector where the actions take place for those who use it.
     */
    public func make(logoutButtonWithTarget target:Any?,
              withCustomIcon customIcon:UIImage? = nil,
              isDefaultPosition defaultPosition:Bool = true,
              andSelector selector: Selector?) {
        
        var logoutButtonItem = UIBarButtonItem()
        
        if let icon = customIcon {
            
            logoutButtonItem = UIBarButtonItem(title: nil, style: .plain, target: target, action: selector)
            logoutButtonItem.image = icon.withRenderingMode(.alwaysTemplate)
        } else {
            
            logoutButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: target, action: selector)
        }
        
        set(button: logoutButtonItem, isDefault: defaultPosition)
    }
    
    /** Set the button created by this extensions. */
    private func set(button barButton:UIBarButtonItem, isDefault: Bool) {
        
        if isDefault {
            
            leftBarButtonItem = barButton
        } else {
            
            rightBarButtonItem = barButton
        }
    }
}
