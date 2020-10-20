//
//  MessagesViewController.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 19.10.2020.
//

import UIKit

class MessagesViewController: UIViewController, MessagesViewProtocol, UITextFieldDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    private var messages: [Message] = []
    var presenter: MessagesPresenterProtocol!
    var nickName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        setUI()
        
    }
    
    func handleOutput(_ output: MessagesPresenterOutput) {
        switch output {
        case .showMessages(let allMessages):
            self.messages = allMessages
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .updateTitle(_):
            break
        }
    }
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        if (messageField.text != nil && messageField.text != ""){
            
            let message = Message(id: "currentUser", text: messageField.text, timestamp: nil, user: User(id: nil, avatarURL: nil, nickname: self.nickName))
            self.messages.append(message)
            self.tableView.reloadData()
            self.messageField.text = ""
            
        }
        
        moveToBottom()
        
    }

}


extension MessagesViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Message") as? MessagesCell {
            
            cell.configCell(message: message)
            cell.backgroundColor = .clear
            return cell
            
        } else {
            
            return MessagesCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
}



extension MessagesViewController {
    
    @objc private func keyboardWillShow(notify: NSNotification) {
        
        if let keyboardSize = (notify.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y == 0 {
                
                self.view.frame.origin.y -= keyboardSize.height + 20
            }
        }
    }
    
    @objc private func keyboardWillHide(notify: NSNotification) {
        
        if ((notify.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            
            if self.view.frame.origin.y != 0 {
                
                self.view.frame.origin.y = 0
            }
        }
    }
    
    @objc private func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    @objc func keyboardNotification(notification: NSNotification) {
         guard let userInfo = notification.userInfo else { return }

         let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
         let endFrameY = endFrame?.origin.y ?? 0
         let duration:TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
         let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
         let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
         let animationCurve:UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)

         if endFrameY >= UIScreen.main.bounds.size.height {
           self.keyboardHeightLayoutConstraint?.constant = 0.0
         } else {
           self.keyboardHeightLayoutConstraint?.constant = endFrame?.size.height ?? 0.0
         }

         UIView.animate(
           withDuration: duration,
           delay: TimeInterval(0),
           options: animationCurve,
           animations: { self.view.layoutIfNeeded() },
           completion: nil)
       }
    
    private func moveToBottom() {
        
        if messages.count > 0  {
            
            let indexPath = IndexPath(row: messages.count - 1, section: 0)
            
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
    
    private func setUI() {
        
        let defaults = UserDefaults.standard
        
        if defaults.bool(forKey: "FirstLaunch") == true {
            
            title = self.nickName
        } else {
            //FIRST LAUNCH
            defaults.setValue(self.nickName, forKeyPath: "nickname")
            title = defaults.string(forKey: "nickName")
            defaults.set(true, forKey: "FirstLaunch")
        }
        
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        var backImage = UIImage(named: "24x24BackButtonImage")
        backImage = backImage?.withTintColor(UIColor.black)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(goBack))
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        title = self.nickName
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            
            self.moveToBottom()
        }
        self.tableView.separatorStyle = .none
        
        let tempImageView = UIImageView(image: UIImage(named: "tableViewBack.png"))
        tempImageView.frame = self.tableView.frame
        self.tableView.backgroundView = tempImageView
        
    }
    
    @objc private func goBack() {
        
        presenter.navigateTo()
    }
    
    
}
