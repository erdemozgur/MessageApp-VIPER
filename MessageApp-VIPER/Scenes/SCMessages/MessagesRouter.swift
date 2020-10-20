//
//  MessagesRouter.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import UIKit

final class MessagesRouter: MessagesRouterProtocol {
        
    func navigate(with nickname: String, viewController: UIViewController) {
    
        viewController.present(GetNickNameBuilder.make(), animated: true, completion: nil)
        
    }
    
}
