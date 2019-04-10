//
//  Date.swift
//
//  Created by Tristan Galang on 02/04/2018.
//  Copyright © 2018 Binary Digital. All rights reserved.
//

import Foundation

public extension Date {
    
    /**
     Returns Date(String) formatted as *Year-Month-Date*.
     ## Example Format:
     - 2012-11-16
     */
    public var commonDateFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return  formatter.string(from: self as Date)
    }
    
    /**
     Returns TimeStamp(String) formatted as *Year-Month-Date Hour:Minutes:Seconds*.
     ## Example Format:
     - 2012-11-16 12:00:00
     */
    public var commonTimeStampFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-d HH:mm:ss"
        return formatter.string(from: self as Date)
    }
    
    /**
     Returns Date(String) readable for the end user.
     ## Example Format:
     - November 16, 2012
     */
    public var endUserDateFormat: String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter.string(from: self as Date)
    }
    
    /**
     Return date(Date) by the given common date string *"yyyy-MM-dd"*.
     ## Example Parameter
     - "2012-11-16"
     ## Example Return
     - Date(2012-11-16 00:00:00)
     */
    public func get(dateFromString dateString:String) -> Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter.date(from: dateString)!
    }
    
    /**
     Return a date from the given string *"yyyy-MM-dd HH:mm:ss"*.
     ## Example Parameter
     - "2012-11-16 12:00:00"
     ## Example Return:
     - Date(2012-11-16 12:00:00)
    */
    public func get(timeStampFromString dateString:String) -> Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter.date(from: dateString)!
    }
}
