//
//  StatusCell.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 04/09/2024.
//

import UIKit

class StatusCell: UITableViewCell {
  
  @IBOutlet weak var statusTime: UILabel!
  @IBOutlet weak var statusName: UILabel!
  @IBOutlet weak var statusView: CircularProgressView!
  @IBOutlet weak var statusImg: UIImageView!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    statusView.segmentSpacing = 0.3
    
    statusImg.layer.cornerRadius = statusImg.frame.height / 2
    statusImg.clipsToBounds = true
  }
  
  func configure(with status: StatusModel) {
    statusView.setProgress(for: status.newStatus, totalSegments: status.totalStatus)
  }
  
}
