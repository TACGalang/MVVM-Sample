//
//  Client.swift
//  MVVM Sample
//
//  Created by macbookpro on 10/04/2019.
//  Copyright © 2019 Tristan. All rights reserved.
//

import Foundation
import Alamofire

class Client {
    
    // Singleton
    static let shared = Client()
    
    // Base URL
    let baseURL:String = "https://api.letsbuildthatapp.com/"
    
    /// Alamofire Manager
    var alamofireManager: SessionManager = {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 30
        configuration.timeoutIntervalForRequest = 30
        
        let alamofireManager = Alamofire.SessionManager(configuration: configuration)
        
        return alamofireManager
    }()
    
    // MARK: - Initialization
    private init() {}
    
    // Get Course
    func get(courseWithCompletion completion:@escaping(_ course:CourseViewModel?)->()) {
        
        alamofireManager.request(EndPoints.jsonDecodableCourse.get(urlWith: baseURL), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result {
                    
                case .success(_ ):
                    
                    if let data = response.data {
                        
                        if let course = try? JSONDecoder().decode(CourseModel.self, from: data) {
                            
                            completion(CourseViewModel(withModel: course))
                        } else {
                            
                            // Error cant decode the JSON Data try to look the response JSON Properties again
                            completion(nil)
                        }
                    } else {
                        
                        // Error decoding failure
                        completion(nil)
                    }
                case .failure(_ ):
                    // Error on connection
                    completion(nil)
                }
        }
    }
}
