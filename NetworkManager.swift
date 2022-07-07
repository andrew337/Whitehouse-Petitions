//
//  NetworkManager.swift
//  Whitehouse Petitions
//
//  Created by Admin on 7/6/22.
//

import Foundation


class NetworkManager {
   static let shared = NetworkManager()
    
    func getPetitions(urlString : String, completion : @escaping (Petitions) -> Void) {

        guard let url = URL(string: urlString) else {
            
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                
                return
            }
            
            guard let data = data else {
                
                return
            }
                
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(Petitions.self, from: data)
                    completion(results)
                   
                } catch {
                    return
                }
            
        }
        task.resume()
    }
    
    
}
