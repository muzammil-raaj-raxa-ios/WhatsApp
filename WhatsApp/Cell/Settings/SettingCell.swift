//
//  SettingCell.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 28/08/2024.
//

import UIKit

class SettingCell: UITableViewCell {
  
  @IBOutlet weak var settingName: UILabel!
  @IBOutlet weak var settingImage: UIImageView!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
