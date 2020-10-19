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
        let viewController = MessagesBuilder.make()
//        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    
}
