//
//  MessagesContracts.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import Foundation

// MARK: - Interactor

protocol MessagesInteractorProtocol: class {
    var delegate: MessagesInteractorDelegate? { get set }
    func load()
}

enum MessagesInteractorOutput {
    case showMessages([Message])
}

protocol MessagesInteractorDelegate: class {
    func handleOutput(_ output: MessagesInteractorOutput)
}

// MARK: - Presenter

protocol MessagesPresenterProtocol: class {
    func load()
}

enum MessagesPresenterOutput {
    case updateTitle(String)
    case showMessages([Message])
}

// MARK: - View

protocol MessagesViewProtocol: class {
    func handleOutput(_ output: MessagesInteractorOutput)
}

// MARK: - Router

//TODO
