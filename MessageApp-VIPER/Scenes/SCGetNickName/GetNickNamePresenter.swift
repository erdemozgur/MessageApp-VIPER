//
//  GetNickNamePresenter.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 20.10.2020.
//

import UIKit

final class GetNickNamePresenter: GetNickNamePresenterProtocol {
    
    private unowned let view: GetNickNameViewProtocol
    private let router: GetNickNameRouterProtocol
    
    init(view: GetNickNameViewProtocol, router: GetNickNameRouterProtocol ) {
        
        self.view = view
        self.router = router
    }
    
    func navigateTo(with nickname: String) {
        router.navigate(with: nickname)
    }
    
}
