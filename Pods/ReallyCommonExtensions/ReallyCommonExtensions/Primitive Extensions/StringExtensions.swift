//
//  String.swift
//
//  Created by Tristan Galang on 03/07/2018.
//  Copyright © 2018 Binary Digital. All rights reserved.
//

import Foundation

public extension String {
    
    /** 
     String verification.
     
     - parameter isEmailVerify: Optional Boolean if the string is for email.
     - parameter minimumCount: Optional Int whether this string should have a minimum character.
     - parameter maximumCount: Optional Int whether this string should have a maximum character.
     */
    public func isValid(enableEmailVerification isEmailVerify:Bool,
                 hasMinimumCount minimumCount:Int? = nil,
                 hasMaximumCount maximumCount:Int? = nil) -> (isValid:Bool, details:String?) {
        
        /// Check String Count
        if self.trimmingCharacters(in: .whitespaces).count <= 0 {
            
            return (false, "empty")
        }
        
        /// Check Email
        if isEmailVerify {
            
            if !self.isValidEmail() {
                
                return (false, "invalid")
            }
        }
        
        /// Check Minimum Count
        if let minCount = minimumCount {
            
            if self.count < minCount {
                
                return (false, "should be atleast \(minCount) characters")
            }
        }
        
        /// Check Maximum Count
        if let maxCount = maximumCount {
            
            if self.count > maxCount {
                
                return (false, "should be atleast \(maxCount) characters")
            }
        }
        
        return (true, nil)
    }
    
    /**
     Convert string to optional JSON
     
     - return: JSON[Dictionary<String, String>]?
     */
    public func getJson() -> [Dictionary<String,String>]? {
        
        let data = self.data(using: .utf8)!
        
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,String>] {
                
                return jsonArray
                
            } else {
                
                return nil
            }
        } catch let error as NSError {
            print(error)
        }
        
        return nil
    }
    
    /**
     Check whether the String is a valid email.
     
     - return: Boolean
     */
    private func isValidEmail() -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        var valid = NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
        if valid {
            valid = !self.contains("..")
        }
        return valid
    }
}
