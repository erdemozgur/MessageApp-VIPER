//
//  MessagesBuilder.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import UIKit

final class MessagesBuilder {
    
    static func make(with nickName: String) -> UINavigationController {
        
        let storyboard = UIStoryboard(name: "Messages", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "MessagesViewController") as! MessagesViewController
        let navigationController: UINavigationController = UINavigationController(rootViewController: view)
        navigationController.modalPresentationStyle = .overFullScreen
        
        let interactor = MessagesInteractor(service: app.service)
        let presenter = MessagesPresenter(view: view, interactor: interactor)
        view.presenter = presenter
        view.nickName = nickName
        
        return navigationController
        
    }
    
}
