//
//  GithubApiClient.swift
//  playingWithGithubBio
//
//  Created by Johann Kerr on 3/7/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit

class GithubApiClient {
    
    class func updateBio(_ bioString: String, completion:@escaping () -> ()) {
        let urlString = "https://api.github.com/user"
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            // adding an http Method
            urlRequest.httpMethod = "PATCH"
            
            
            // adding a Header with token and your access 
            urlRequest.addValue("token ", forHTTPHeaderField: "Authorization")
            
            // Creating a dictionary
            
            let body: [String: String] = ["bio":"\(bioString)"]
            let session = URLSession.shared
            do {
                
                // Turn dictionary to Data
                
                let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
                
                // Set data to http body
                urlRequest.httpBody = jsonData
                
                
                // Send our request
                let dataTask = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                    
                    // Read request
                    
                    if let data = data {
                        do {
                            let responseJSON = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:]
                            let bio = responseJSON["bio"] as? String ?? ""
                            print(bio)
                            completion()
                        } catch {
                            
                        }
                        
                    }
                    
                    
                })
                
                dataTask.resume()
                
                
                
                
                
            } catch {
                
            }
            
        
            
            
        }
        
        
    
    }

}
