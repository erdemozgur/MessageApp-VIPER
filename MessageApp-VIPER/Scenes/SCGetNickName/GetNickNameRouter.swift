//
//  GetNickNameRouter.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 20.10.2020.
//

import UIKit

final class GetNickNameRouter: GetNickNameRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        
        self.view = view
        
    }
        
    func navigate(with nickname: String) {
    
        self.view.present(MessagesBuilder.make(with: nickname), animated: true, completion: nil)
        
    }
    
}
