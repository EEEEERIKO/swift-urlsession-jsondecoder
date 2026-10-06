//
//  main.swift
//  swift-networking
//
//  Created by Erik Valencia Cardona on 6/10/26.
//
import Foundation

struct User: Decodable {
    let email: String
}

let url = URL(
    string: "https://jsonplaceholder.typicode.com/users"
)!

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    
    if let error {
        print("Network error:", error)
        return
    }
    
    guard let data else {
        print("No data received")
        return
    }
    
    do {
        let decoder = JSONDecoder()
        
        let users = try decoder.decode(
            [User].self,
            from: data
        )
        
        let emails = users.map { $0.email }
        
        emails.forEach {
            print($0)
        }
        
    } catch {
        print("Decoding error:", error)
    }
}

task.resume()

RunLoop.main.run()
