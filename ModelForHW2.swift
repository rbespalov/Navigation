//
//  ModelForHW2.swift
//  Navigation
//
//  Created by Роман Беспалов on 15.10.2022.
//

import Foundation

struct Todos: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}

struct Planets: Codable {
    var name: String
    var rotationPeriod: String
    var orbitalPeriod: String
    var climate: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case climate
    }
}

func getTitle(completion: ((_ title: String?) -> Void)?) {
    
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { data, response, error in
        
        if let error {
            print(error.localizedDescription)
            completion?(nil)
            return
        }
        
        if (response as! HTTPURLResponse).statusCode != 200 {
            print("Status code != 200, Statuse code is \((response as! HTTPURLResponse).statusCode) ")
            completion?(nil)
            return
        }
        
        guard let data else {
            print("Data = nil")
            completion?(nil)
            return
        }
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                if let title = json[5]["title"] as? String {
                    print(title)
                    completion?(title)
                }
            }
        } catch {
            print(error)
            completion?(nil)
        }
    }
    
    task.resume()
}

func getRotationPeriod(completion: ((_ period: String?) -> Void)?) {
    
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: URL(string: "https://swapi.dev/api/planets/1")!) { data, response, error in
        
        if let error {
            print(error.localizedDescription)
            completion?(nil)
            return
        }
        
        if (response as? HTTPURLResponse)?.statusCode != 200 {
            print("Status != 200, Status code is \((response as? HTTPURLResponse)?.statusCode != 200) ")
            completion?(nil)
            return
        }
        
        guard let data else {
            print("Dita = nil")
            completion?(nil)
            return
        }
        
        do {
            let answer = try JSONDecoder().decode(Planets.self, from: data)
            completion?(answer.orbitalPeriod)
        } catch {
            print(error)
            completion?(nil)
            return
        }
    }
    task.resume()
}
