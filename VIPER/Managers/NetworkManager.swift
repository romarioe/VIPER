//
//  NetworkManager.swift
//  VIPER
//
//  Created by Roman Efimov on 11.09.2020.
//  Copyright © 2020 Roman Efimov. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let coursesURL = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    
    private init() {}
    
    func fetchData(completion: @escaping (_ courses: [Course]) -> Void) {
        guard let url = URL(string: coursesURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                completion(courses)
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}
