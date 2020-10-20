//
//  ErrorPresenter.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 20.10.2020.
//

import UIKit

class ErrorPresenter {
    
    static func showError(message: String, on viewController: UIViewController?, dismissAction: ((UIAlertAction) -> Void)? = nil) {
      weak var vc = viewController
      DispatchQueue.main.async {
        let alertController = UIAlertController(title: "Important",
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: dismissAction))
        vc?.present(alertController, animated: true)
      }
    }
    
    
}

enum ErrorMessages: String {
    
    case writeCorrect = "Please write a correct nickname"
}
