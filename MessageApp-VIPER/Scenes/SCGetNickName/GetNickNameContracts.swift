//
//  GetNickNameContracts.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 20.10.2020.
//

import UIKit

// MARK: - Interactor

// MARK: - Presenter

enum GetNickNamePresenterOutput {
    case updateNickName(String)
}

// MARK: - View

protocol GetNickNameViewProtocol: class {
    func handleOutput(_ output: GetNickNamePresenterOutput)
}

//MARK: - ROUTER
protocol GetNickNameRouterProtocol: class {
    func navigate(with nickname: String, viewController: UIViewController)
}




