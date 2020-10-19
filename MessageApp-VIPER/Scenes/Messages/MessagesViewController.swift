//
//  MessagesViewController.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import UIKit

class MessagesViewController: UIViewController, MessagesViewProtocol {

//    var service: MessageServiceProtocol!
    
//    @IBOutlet private weak var tableView: UITableView!
    
    private var messages: [Message] = []
    var presenter: MessagesPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        
    }
    
    func handleOutput(_ output: MessagesInteractorOutput) {
        switch output {
        case .showMessages(let allMessages):
            self.messages = allMessages
            print(allMessages.forEach({ (message) in
                print(message.user!.nickname!)
            }))
//            tableView.reloadData()
        }
    }


}

