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
    private let router: MessagesRouterProtocol
    
    init(view: MessagesViewProtocol, interactor: MessagesInteractorProtocol, router: MessagesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
    
    func load() {
        interactor.load()
    }
    
    func navigateTo() {
        router.navigate()
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
