//
//  File.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 24/08/2024.
//

import Foundation
import UIKit

extension UIView {

  func addBottomBorderView(color: UIColor) {
   let bottomline = CALayer()
   bottomline.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
    bottomline.backgroundColor = color.cgColor
   self.layer.addSublayer(bottomline)
 }

}


extension UITextField {
 func addBottomBorderTF() {
   let bottomline = CALayer()
   bottomline.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.size.width, height: 1)
   bottomline.backgroundColor = UIColor.GREEN.cgColor
   self.borderStyle = .none
   self.layer.addSublayer(bottomline)
 }
}


extension UIViewController {
  func alertMessage(message: String) {
    let alert = UIAlertController(title: "WhatsApp", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}


