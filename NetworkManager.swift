//
//  NetworkManager.swift
//  Navigation
//
//  Created by Роман Беспалов on 12.10.2022.
//

import Foundation



enum AppConfiguration: String, CaseIterable {
    
    case firstStringURL = "https://swapi.dev/api/people/8"
    case secondStringURL = "https://swapi.dev/api/starships/3"
    case thirdStringURL = "https://swapi.dev/api/planets/5"
}

var appConfiguration: AppConfiguration?

struct NetworkManager {
    static func request(for configuration: AppConfiguration) {
                
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: URL(string: appConfiguration!.rawValue)!) { data, respose, error in
            
            if let error {
                print(error.localizedDescription)
                return
            }
            
            if (respose as! HTTPURLResponse).statusCode != 200 {
                print ("Error, statuse code is \((respose as! HTTPURLResponse).statusCode)")
                return
            }
            
            guard let data else {
                print("No data")
                return
            }

            do {
                let answer = try JSONSerialization.jsonObject(with: data)
                print(answer)
                print("===============")
                print("\((respose as! HTTPURLResponse).allHeaderFields)")
                print("===============")
                print("\((respose as! HTTPURLResponse).statusCode)")
                return
                
                // erroe - The Internet connection appears to be offline.
                
            }
            catch {
                print(error.localizedDescription.debugDescription)
            }
        }
        task.resume()
    }
}
