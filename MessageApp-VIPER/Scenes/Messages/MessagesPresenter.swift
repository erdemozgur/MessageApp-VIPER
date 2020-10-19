//
//  MessagesPresenter.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import Foundation

final class MessagesPresenter: MessagesPresenterProtocol {
    
    private unowned let view: MessagesViewProtocol
    private let interactor: MessagesInteractorProtocol
    
    init(view: MessagesViewProtocol, interactor: MessagesInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.interactor.delegate = self
    }
    
    func load() {
        interactor.load()
    }
    
}

extension MessagesPresenter: MessagesInteractorDelegate {
    
    func handleOutput(_ output: MessagesInteractorOutput) {
        switch output {
        case .showMessages(let messages):
            view.handleOutput(.showMessages(messages))
        }
    }
    
}
