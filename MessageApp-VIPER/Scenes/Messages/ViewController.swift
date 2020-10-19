//
//  ViewController.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import UIKit

class ViewController: UIViewController {

//    var service: MessageServiceProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MessagesService.shared.fetchAllMessages { [weak self] (result) in
            
            guard self != nil else { return }
            
            switch result {
            case .success(let messages):
                print(messages.messages.count)
                
            case .failure(let error):
                print(error)
            }
        }
        
        
    }


}

