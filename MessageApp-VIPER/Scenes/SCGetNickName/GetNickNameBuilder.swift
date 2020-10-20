//
//  GetNickNameBuilder.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 20.10.2020.
//

import UIKit

final class GetNickNameBuilder {
    
    static func make() -> GetNickNameViewController {
        
        let storyboard = UIStoryboard(name: "GetNickName", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "GetNickName") as! GetNickNameViewController
        let router = GetNickNameRouter()
        view.router = router
        return view
        
    }
    
}
