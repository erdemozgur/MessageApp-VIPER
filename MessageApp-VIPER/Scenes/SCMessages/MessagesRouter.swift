//
//  MessagesRouter.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import UIKit

final class MessagesRouter: MessagesRouterProtocol {
    
    unowned let view: UIViewController
    init(view: UIViewController) {
        self.view = view
    }
        
    func navigate() {
    
        self.view.present(GetNickNameBuilder.make(), animated: true, completion: nil)
        
    }
    
}
