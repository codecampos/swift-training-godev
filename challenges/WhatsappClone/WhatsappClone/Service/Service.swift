//
//  Service.swift
//  WhatsappClone
//
//  Created by Idwall Go Dev 013 on 25/03/22.
//


import Foundation

enum FriendError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvaliable
}

protocol ServiceProtocol {
    func getFriends(completion: @escaping(Result<[Message], FriendError>) -> Void)
}

class Service: ServiceProtocol {
    
    let session = URLSession.shared
    let baseURL = "https://run.mocky.io/v3/9e7b7de7-31da-41b6-ad43-6d64ade5bbbf"
    
    static var shared: Service = {
        let instance = Service()
        return instance
    }()
    
    
    func getFriends(completion: @escaping (Result<[Message], FriendError>) -> Void) {
        guard let baseURL = URL(string: baseURL) else { return completion(.failure(.urlInvalid)) }
        
        let dataTask = session.dataTask(with: baseURL) { data, _ , _ in
            
            do {
                
                guard let jsonData = data else { return completion(.failure(.noDataAvaliable))}
                
                let decoder = JSONDecoder()
                
                let personResponse = try decoder.decode([Message].self, from: jsonData)
                
                completion(.success(personResponse))
                
            } catch  {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()
    }
}

