//
//  GetNickNameViewController.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 20.10.2020.
//

import UIKit

class GetNickNameViewController: UIViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var middleView: UIView!

    var router: GetNickNameRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func continuePressed(_ sender: Any) {
        let textFieldCount = nickNameTextField.text?.count
        guard nickNameTextField.text != nil && textFieldCount! > 2 else {
            ErrorPresenter.showError(message: "Please write a correct nickname.", on: self)
            return
        }
        router?.navigate(with: nickNameTextField.text! , viewController: self)
        
    }

}

