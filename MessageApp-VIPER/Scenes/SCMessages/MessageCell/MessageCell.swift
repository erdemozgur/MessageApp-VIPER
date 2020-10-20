//
//  MessageCell.swift
//  MessageApp-VIPER
//
//  Created by Erdem Özgür on 20.10.2020.
//

import UIKit

class MessagesCell: UITableViewCell {
    
    @IBOutlet weak var recievedMessageLbl: UILabel!
    @IBOutlet weak var recievedMessageNickLabel: UILabel!
    @IBOutlet weak var recievedMessageView: UIView!
    
    @IBOutlet weak var sentMessageLbl: UILabel!
    @IBOutlet weak var sentMessageView: UIView!
    @IBOutlet weak var sentMessageNickLabel: UILabel!
    
    var message: Message!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recievedMessageView.makeViewBound()
        sentMessageView.makeViewBound()
        selectionStyle = .none
        
    }
    
    func configCell(message: Message) {
        
        self.message = message
        
        if message.id == "currentUser" {
            
            sentMessageView.isHidden = false
            
            sentMessageLbl.text = message.text
            sentMessageNickLabel.text = message.user?.nickname
            
            recievedMessageLbl.text = ""
            recievedMessageNickLabel.text = ""
            
            recievedMessageView.isHidden = true
            
        } else {
            
            sentMessageView.isHidden = true
            
            sentMessageLbl.text = ""
            sentMessageNickLabel.text = ""
            
            recievedMessageLbl.text = message.text
            recievedMessageNickLabel.text = message.user?.nickname
            
            recievedMessageView.isHidden = false

        }
        
    }
    
}

extension UIView {
    
    func makeViewBound() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 15
    }
    
}
