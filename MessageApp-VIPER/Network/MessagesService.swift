//
//  MessagesService.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import Foundation

public protocol MessageServiceProtocol {

    func fetchAllMessages(completion: @escaping (Result<Messages>) -> Void)

}

public class MessagesService: MessageServiceProtocol {
    
    
    static let shared = MessagesService()
    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init() { }
    
    
    public func fetchAllMessages(completion: @escaping (Result<Messages>) -> Void) {
        
        let urlString = dataURL.url.rawValue
        let url = URL(string: urlString)
        
        let dataTask = URLSession.shared
            .dataTask(with: url!) { (data, _, error) in
                guard let jsonData = data else {
                    completion(.failure(Error.serializationError(internal: error as! Error)))
                    return
                }
                do {
                    let response = try JSONDecoder().decode(Messages.self, from: jsonData)
                    completion(.success(response))
                }
                catch {
                    completion(.failure(Error.serializationError(internal: error)))
                    
                }
                
            }
        dataTask.resume()
    }
    
    
}

extension MessagesService {
    
    enum dataURL: String {
        
        case url = "https://jsonblob.com/api/jsonBlob/62455171-0fb1-11eb-9f83-ffcd873e5c3a"
        
    }
    
    
}
