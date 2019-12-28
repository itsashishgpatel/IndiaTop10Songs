//
//  APICall.swift
//  IndiaTop10Songs
//
//  Created by IMCS2 on 12/28/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import Foundation

class APIManager {


func APICall(completionHandler: @escaping (Welcome) -> () ) {
    
    let urlString = "https://rss.itunes.apple.com/api/v1/in/itunes-music/top-songs/all/10/explicit.json"
    
    guard let url = URL(string: urlString) else {return}
    
    URLSession.shared.dataTask(with: url) {(data,response,error) in
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        do {
            
            let retrievedData = try JSONDecoder().decode(Welcome.self, from: data!)
        
            completionHandler(retrievedData)
        }
            
        catch _ {
            print("Unable to parse data")
        }
        
        
    }.resume()
    
  
    
}

}
