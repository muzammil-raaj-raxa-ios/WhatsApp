//
//  ChatCell.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 30/08/2024.
//

import UIKit

class ChatCell: UITableViewCell {
  
  @IBOutlet weak var msgCountView: UIView!
  @IBOutlet weak var muteNotificationImg: UIImageView!
  @IBOutlet weak var msgsCount: UILabel!
  @IBOutlet weak var msgTimeorDate: UILabel!
  @IBOutlet weak var lastMsg: UILabel!
  @IBOutlet weak var profileName: UILabel!
  @IBOutlet weak var profileImg: UIImageView!
  

    override func awakeFromNib() {
        super.awakeFromNib()
      
      profileImg.layer.cornerRadius = profileImg.frame.size.width / 2
      profileImg.layer.masksToBounds = true
      msgCountView.layer.cornerRadius = msgCountView.frame.size.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
