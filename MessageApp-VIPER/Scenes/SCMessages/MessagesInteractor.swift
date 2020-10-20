//
//  MessagesInteractor.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import Foundation

final class MessagesInteractor: MessagesInteractorProtocol {
    
    private let service: MessageServiceProtocol
    private var messages: [Message] = []
    weak var delegate: MessagesInteractorDelegate?
    
    init(service: MessageServiceProtocol) {
        self.service = service
    }
    
    func load() {
        
        service.fetchAllMessages { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let allMessages):
                self!.messages = allMessages.messages
                self?.delegate?.handleOutput(.showMessages(allMessages.messages))
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
