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
  return UIImage(named: "person")
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

var chats: [ChatModel] = [
  ChatModel(userImage: UIImage(named: "profile2") ?? UIImage(systemName: "person.circle.fill"), userName: "Raaj", userLastMsg: "Are you millionaire yet?", lastMsgTimeOrDate: "12:00 PM", isMute: false, unreadMsgCount: 2),
  ChatModel(userImage: UIImage(named: "profile1") ?? UIImage(systemName: "person.circle.fill"), userName: "Ali", userLastMsg: "Ye meme dekh", lastMsgTimeOrDate: "Friday", isMute: false, unreadMsgCount: 0),
  ChatModel(userImage: UIImage(named: "profile3") ?? UIImage(systemName: "person.circle.fill"), userName: "Usama", userLastMsg: "Wassup nigga?", lastMsgTimeOrDate: "2:00 PM", isMute: false, unreadMsgCount: 4),
  ChatModel(userImage: UIImage(named: "profile4") ?? UIImage(systemName: "person.circle.fill"), userName: "Muteeb", userLastMsg: "Hommie aik naya idea aya hai.", lastMsgTimeOrDate: "9:36 AM", isMute: false, unreadMsgCount: 3),
  ChatModel(userImage: UIImage(named: "profile5") ?? UIImage(systemName: "person.circle.fill"), userName: "Mustafa", userLastMsg: "Ye foreign scholarships aye huwe hain dekh or apply kr", lastMsgTimeOrDate: "Sunday", isMute: true, unreadMsgCount: 0),
  ChatModel(userImage: UIImage(named: "profile2") ?? UIImage(systemName: "person.circle.fill"), userName: "Raaj", userLastMsg: "Are you millionaire yet?", lastMsgTimeOrDate: "12:00 PM", isMute: false, unreadMsgCount: 1),
  ChatModel(userImage: UIImage(named: "profile1") ?? UIImage(systemName: "person.circle.fill"), userName: "Ali", userLastMsg: "Ye meme dekh", lastMsgTimeOrDate: "Friday", isMute: false, unreadMsgCount: 2),
  ChatModel(userImage: UIImage(named: "profile3") ?? UIImage(systemName: "person.circle.fill"), userName: "Usama", userLastMsg: "Wassup nigga?", lastMsgTimeOrDate: "2:00 PM", isMute: false, unreadMsgCount: 3),
  ChatModel(userImage: UIImage(named: "profile4") ?? UIImage(systemName: "person.circle.fill"), userName: "Muteeb", userLastMsg: "Hommie aik naya idea aya hai.", lastMsgTimeOrDate: "9:36 AM", isMute: false, unreadMsgCount: 0),
  ChatModel(userImage: UIImage(named: "profile5") ?? UIImage(systemName: "person.circle.fill"), userName: "Mustafa", userLastMsg: "Ye foreign scholarships aye huwe hain dekh or apply kr", lastMsgTimeOrDate: "Sunday", isMute: true, unreadMsgCount: 4),
  ChatModel(userImage: UIImage(named: "profile1") ?? UIImage(systemName: "person.circle.fill"), userName: "Ali", userLastMsg: "Ye meme dekh", lastMsgTimeOrDate: "Friday", isMute: false, unreadMsgCount: 0),
  ChatModel(userImage: UIImage(named: "profile3") ?? UIImage(systemName: "person.circle.fill"), userName: "Usama", userLastMsg: "Wassup nigga?", lastMsgTimeOrDate: "2:00 PM", isMute: false, unreadMsgCount: 4),
  ChatModel(userImage: UIImage(named: "profile4") ?? UIImage(systemName: "person.circle.fill"), userName: "Muteeb", userLastMsg: "Hommie aik naya idea aya hai.", lastMsgTimeOrDate: "9:36 AM", isMute: false, unreadMsgCount: 3),
  ChatModel(userImage: UIImage(named: "profile5") ?? UIImage(systemName: "person.circle.fill"), userName: "Mustafa", userLastMsg: "Ye foreign scholarships aye huwe hain dekh or apply kr", lastMsgTimeOrDate: "Sunday", isMute: true, unreadMsgCount: 0),
  ChatModel(userImage: UIImage(named: "profile2") ?? UIImage(systemName: "person.circle.fill"), userName: "Raaj", userLastMsg: "Are you millionaire yet?", lastMsgTimeOrDate: "12:00 PM", isMute: false, unreadMsgCount: 1),
  ChatModel(userImage: UIImage(named: "profile1") ?? UIImage(systemName: "person.circle.fill"), userName: "Ali", userLastMsg: "Ye meme dekh", lastMsgTimeOrDate: "Friday", isMute: false, unreadMsgCount: 2),
  ChatModel(userImage: UIImage(named: "profile3") ?? UIImage(systemName: "person.circle.fill"), userName: "Usama", userLastMsg: "Wassup nigga?", lastMsgTimeOrDate: "2:00 PM", isMute: false, unreadMsgCount: 3),
  ChatModel(userImage: UIImage(named: "profile4") ?? UIImage(systemName: "person.circle.fill"), userName: "Muteeb", userLastMsg: "Hommie aik naya idea aya hai.", lastMsgTimeOrDate: "9:36 AM", isMute: false, unreadMsgCount: 0),
  ChatModel(userImage: UIImage(named: "profile5") ?? UIImage(systemName: "person.circle.fill"), userName: "Mustafa", userLastMsg: "Ye foreign scholarships aye huwe hain dekh or apply kr", lastMsgTimeOrDate: "Sunday", isMute: true, unreadMsgCount: 4),
]

var calls: [CallModel] = [
  CallModel(callerImage: UIImage(named: "profile1"), callerName: "raaj", callingStatusImg: UIImage(systemName: "phone.arrow.up.right.fill") ?? UIImage(), callingStatusName: "Outgoing", callTimeOrDate: "12:12 PM"),
  CallModel(callerImage: UIImage(named: "profile2"), callerName: "manzar", callingStatusImg: UIImage(systemName: "phone.arrow.down.left.fill") ?? UIImage(), callingStatusName: "Missed", callTimeOrDate: "Yesterday"),
  CallModel(callerImage: UIImage(named: "profile2"), callerName: "farhan", callingStatusImg: UIImage(systemName: "phone.arrow.down.left.fill") ?? UIImage(), callingStatusName: "Incoming", callTimeOrDate: "Yesterday"),
  CallModel(callerImage: UIImage(named: "profile3"), callerName: "saad", callingStatusImg: UIImage(systemName: "arrow.up.right.video.fill") ?? UIImage(), callingStatusName: "Outgoing", callTimeOrDate: "12/06/2002"),
  CallModel(callerImage: UIImage(named: "profile4"), callerName: "arslan", callingStatusImg: UIImage(systemName: "phone.arrow.down.left.fill") ?? UIImage(), callingStatusName: "Missed", callTimeOrDate: "Yesterday"),
  CallModel(callerImage: UIImage(named: "profile2"), callerName: "hameed", callingStatusImg: UIImage(systemName: "phone.arrow.down.left.fill") ?? UIImage(), callingStatusName: "Incoming", callTimeOrDate: "Yesterday"),
  CallModel(callerImage: UIImage(named: "profile3"), callerName: "tahir", callingStatusImg: UIImage(systemName: "arrow.up.right.video.fill") ?? UIImage(), callingStatusName: "Outgoing", callTimeOrDate: "12/06/2002"),
  CallModel(callerImage: UIImage(named: "profile4"), callerName: "salman", callingStatusImg: UIImage(systemName: "phone.arrow.down.left.fill") ?? UIImage(), callingStatusName: "Missed", callTimeOrDate: "Yesterday"),
  CallModel(callerImage: UIImage(named: "profile1"), callerName: "raaj", callingStatusImg: UIImage(systemName: "phone.arrow.up.right.fill") ?? UIImage(), callingStatusName: "Outgoing", callTimeOrDate: "12:12 PM"),
  CallModel(callerImage: UIImage(named: "profile2"), callerName: "manzar", callingStatusImg: UIImage(systemName: "phone.arrow.down.left.fill") ?? UIImage(), callingStatusName: "Missed", callTimeOrDate: "Yesterday"),
  CallModel(callerImage: UIImage(named: "profile2"), callerName: "farhan", callingStatusImg: UIImage(systemName: "phone.arrow.down.left.fill") ?? UIImage(), callingStatusName: "Incoming", callTimeOrDate: "Yesterday"),
  CallModel(callerImage: UIImage(named: "profile3"), callerName: "saad", callingStatusImg: UIImage(systemName: "arrow.up.right.video.fill") ?? UIImage(), callingStatusName: "Outgoing", callTimeOrDate: "12/06/2002"),
  CallModel(callerImage: UIImage(named: "profile4"), callerName: "arslan", callingStatusImg: UIImage(systemName: "phone.arrow.down.left.fill") ?? UIImage(), callingStatusName: "Missed", callTimeOrDate: "Yesterday"),
  CallModel(callerImage: UIImage(named: "profile2"), callerName: "hameed", callingStatusImg: UIImage(systemName: "phone.arrow.down.left.fill") ?? UIImage(), callingStatusName: "Incoming", callTimeOrDate: "Yesterday"),
  CallModel(callerImage: UIImage(named: "profile3"), callerName: "tahir", callingStatusImg: UIImage(systemName: "arrow.up.right.video.fill") ?? UIImage(), callingStatusName: "Outgoing", callTimeOrDate: "12/06/2002"),
  CallModel(callerImage: UIImage(named: "profile4"), callerName: "salman", callingStatusImg: UIImage(systemName: "phone.arrow.down.left.fill") ?? UIImage(), callingStatusName: "Missed", callTimeOrDate: "Yesterday"),
]

func getHapticFeedback() {
  let haptic = UIImpactFeedbackGenerator(style: .heavy)
  haptic.impactOccurred()
}

var statuses: [StatusModel] = [
  StatusModel(statusImg: UIImage(named: "profile1")!, statusName: "Hameed", statusTime: "16h ago", newStatus: 1, totalStatus: 1),
  StatusModel(statusImg: UIImage(named: "profile2")!, statusName: "Manzar", statusTime: "36m ago", newStatus: 1, totalStatus: 2),
  StatusModel(statusImg: UIImage(named: "profile3")!, statusName: "Saad", statusTime: "1h ago", newStatus: 2, totalStatus: 3),
  StatusModel(statusImg: UIImage(named: "profile4")!, statusName: "Farhan", statusTime: "3h ago", newStatus: 3, totalStatus: 4),
  StatusModel(statusImg: UIImage(named: "profile5")!, statusName: "Arslan", statusTime: "7m ago", newStatus: 4, totalStatus: 5),StatusModel(statusImg: UIImage(named: "profile2")!, statusName: "Manzar", statusTime: "36m ago", newStatus: 1, totalStatus: 2),
  StatusModel(statusImg: UIImage(named: "profile3")!, statusName: "Saad", statusTime: "1h ago", newStatus: 2, totalStatus: 3),
  StatusModel(statusImg: UIImage(named: "profile1")!, statusName: "Hameed", statusTime: "16h ago", newStatus: 1, totalStatus: 1),
]

var viewStatuses: [StatusModel] = []

var mutedStatuses: [StatusModel] = [
  StatusModel(statusImg: UIImage(named: "profile1")!, statusName: "Hameed", statusTime: "16h ago", newStatus: 1, totalStatus: 1),
  StatusModel(statusImg: UIImage(named: "profile2")!, statusName: "Manzar", statusTime: "36m ago", newStatus: 1, totalStatus: 2),
  StatusModel(statusImg: UIImage(named: "profile3")!, statusName: "Saad", statusTime: "1h ago", newStatus: 2, totalStatus: 3),
  StatusModel(statusImg: UIImage(named: "profile4")!, statusName: "Farhan", statusTime: "3h ago", newStatus: 3, totalStatus: 4),
  StatusModel(statusImg: UIImage(named: "profile5")!, statusName: "Arslan", statusTime: "7m ago", newStatus: 4, totalStatus: 5),
  StatusModel(statusImg: UIImage(named: "profile1")!, statusName: "Hameed", statusTime: "16h ago", newStatus: 1, totalStatus: 1),
]

