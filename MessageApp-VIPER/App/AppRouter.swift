//
//  AppRouter.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    
    func start() {
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "FirstLaunch") == true {
            
            let viewController = MessagesBuilder.make(with: defaults.string(forKey: "nickname")!)
            window.rootViewController = viewController
            window.makeKeyAndVisible()
            
        } else {
            
            let viewController = GetNickNameBuilder.make()
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        }
       
    }
    
    
    
    
}
