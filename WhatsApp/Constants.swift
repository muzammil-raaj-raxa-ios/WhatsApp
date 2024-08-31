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


func setProfileImg(_ image: UIImage, forKey key: String) {
  if let data = image.pngData() {
    UserDefaults.standard.setValue(data, forKey: key)
  }
}

func getProfileImg(forKey key: String) -> UIImage? {
  if let data = UserDefaults.standard.value(forKey: key) {
    return UIImage(data: data as! Data)
  }
  return UIImage(systemName: "person.fill")
}


let firstSettingTblViewItem = [
  SettingCellModel(image: UIImage(systemName: "heart") ?? UIImage(), name: "Favorites"),
  SettingCellModel(image: UIImage(named: "horn") ?? UIImage(), name: "Broadcast lists"),
  SettingCellModel(image: UIImage(systemName: "star") ?? UIImage(), name: "Starred messages"),
  SettingCellModel(image: UIImage(named: "laptop") ?? UIImage(), name: "Linked devices")
]

let secondSettingTblViewItem = [
  SettingCellModel(image: UIImage(systemName: "key") ?? UIImage(), name: "Account"),
  SettingCellModel(image: UIImage(systemName: "lock") ?? UIImage(), name: "Privacy"),
  SettingCellModel(image: UIImage(systemName: "message") ?? UIImage(), name: "Chats"),
  SettingCellModel(image: UIImage(systemName: "app.badge") ?? UIImage(), name: "Notifications"),
  SettingCellModel(image: UIImage(systemName: "arrow.up.arrow.down") ?? UIImage(), name: "Storage and Data")
]

let thirdSettingTblViewItem = [
  SettingCellModel(image: UIImage(systemName: "info.circle") ?? UIImage(), name: "Help"),
  SettingCellModel(image: UIImage(systemName: "person.2") ?? UIImage(), name: "Invite a friend")
]

let fourthSettingTblViewItem = [
  SettingCellModel(image: UIImage(named: "instagram") ?? UIImage(), name: "Open Instagram"),
  SettingCellModel(image: UIImage(named: "facebook") ?? UIImage(), name: "Open Facebook")
]

func setupBtnGreenBgAndLabel(btn: UIButton) {
  btn.tintColor = UIColor.chatGreenLabel
  btn.backgroundColor = UIColor.chatGreenView
}

func setupBtnGreyBgAndLabel(btn: UIButton) {
  btn.tintColor = UIColor.chatGrayLabel
  btn.backgroundColor = UIColor.chatGrayView
}
