//
//  GetNickNameRouter.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 20.10.2020.
//

import UIKit

final class GetNickNameRouter: GetNickNameRouterProtocol {
        
    func navigate(with nickname: String, viewController: UIViewController) {
    
        viewController.present(MessagesBuilder.make(with: nickname), animated: true, completion: nil)
        
    }
    
}
