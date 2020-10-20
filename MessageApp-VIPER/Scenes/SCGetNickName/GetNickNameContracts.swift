//
//  GetNickNameContracts.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 20.10.2020.
//

import UIKit

// MARK: - Interactor

// MARK: - Presenter
protocol GetNickNamePresenterProtocol: class {
    func navigateTo(with nickname: String)
}


// MARK: - View

protocol GetNickNameViewProtocol: class {
}

//MARK: - ROUTER
protocol GetNickNameRouterProtocol: class {
    func navigate(with nickname: String)
}




