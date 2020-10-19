//
//  Message.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import Foundation

public struct Messages: Codable {
    
    var messages: [Message]
    
}

public struct Message: Codable {
    
    var id: String?
    var text: String?
    var timestamp: Int?
    var user: User?
    
}

public struct User: Codable {
    
    var id: String?
    var avatarURL: String?
    var nickname: String?
    
}
