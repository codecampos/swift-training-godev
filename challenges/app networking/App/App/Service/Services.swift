//
//  Services.swift
//  App
//
//  Created by Idwall Go Dev 013 on 21/03/22.
//

import Foundation

enum PersonError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvaliable
}

protocol ServiceProtocol {
    func getPersons(completion: @escaping(Result<[Person], PersonError>) -> Void)
}

class Service: ServiceProtocol {
    
    let session = URLSession.shared
    let baseURL = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    static var shared: Service = {
        let instance = Service()
        return instance
    }()
    
    
    func getPersons(completion: @escaping (Result<[Person], PersonError>) -> Void) {
        guard let baseURL = URL(string: baseURL) else { return completion(.failure(.urlInvalid)) }
        
        let dataTask = session.dataTask(with: baseURL) { data, _ , _ in
            
            do {
                
                guard let jsonData = data else { return completion(.failure(.noDataAvaliable))}
                
                let decoder = JSONDecoder()
                
                let personResponse = try decoder.decode([Person].self, from: jsonData)
                
                completion(.success(personResponse))
                
            } catch  {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()
    }
}
