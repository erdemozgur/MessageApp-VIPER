//
//  MessagesBuilder.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import UIKit

final class MessagesBuilder {
    
    static func make() -> ViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        viewController.service = app.service
        return viewController
        
    }
    
    
}
