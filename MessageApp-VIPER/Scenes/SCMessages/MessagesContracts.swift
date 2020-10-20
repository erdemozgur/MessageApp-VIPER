//
//  MessagesContracts.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import UIKit

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
    func handleOutput(_ output: MessagesPresenterOutput)
}

// MARK: - Router

protocol MessagesRouterProtocol: class {
    func navigate(with nickname: String, viewController: UIViewController)
}
