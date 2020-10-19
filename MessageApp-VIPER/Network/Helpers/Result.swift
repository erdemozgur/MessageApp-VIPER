//
//  Result.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import Foundation

public enum Result<Value> {
    
    case success(Value)
    case failure(Error)
    
}
