//
//  GetNickNameViewController.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 20.10.2020.
//

import UIKit

class GetNickNameViewController: UIViewController, GetNickNameViewProtocol {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var middleView: UIView!

    var presenter: GetNickNamePresenterProtocol?
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

    }
    
    private func setUI() {
        
        nickNameTextField.tintColor = UIColor.clear
        nickNameTextField.layer.masksToBounds = true
        nickNameTextField.layer.cornerRadius = 10
        
        continueButton.layer.masksToBounds = true
        continueButton.layer.cornerRadius = 10
        
    }
    
    
    @IBAction func continuePressed(_ sender: Any) {
        let textFieldCount = nickNameTextField.text?.count
        guard nickNameTextField.text != nil && textFieldCount! > 2 else {
            ErrorPresenter.showError(message: ErrorMessages.writeCorrect.rawValue, on: self)
            return
        }
        defaults.setValue(nickNameTextField.text!, forKeyPath: "nickname")
        presenter!.navigateTo(with: defaults.value(forKey: "nickname") as! String)
        
    }

}

