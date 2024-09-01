//
//  ChatsVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 29/08/2024.
//

import UIKit

class ChatsVC: UIViewController, UISearchBarDelegate {
  
  @IBOutlet weak var chatTblViewHeight: NSLayoutConstraint!
  @IBOutlet weak var chatsTblView: UITableView!
  @IBOutlet weak var groupBtn: UIButton!
  @IBOutlet weak var favBtn: UIButton!
  @IBOutlet weak var unreadBtn: UIButton!
  @IBOutlet weak var allBtn: UIButton!
  @IBOutlet weak var chatSearchBar: UISearchBar!
  @IBOutlet weak var navCameraBtn: UIBarButtonItem!
  @IBOutlet weak var navPlusBtn: UIBarButtonItem!
  @IBOutlet weak var threeDotBtn: UIBarButtonItem!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupThreeDotBtn()
    setupSearchBar()
    setupChatTblView()
  }
  
  
  @IBAction func navPlusBtn(_ sender: UIBarButtonItem) {
    print("plus button tapped")
  }
  
  @IBAction func allBtn(_ sender: Any) {
      setButtonBackground(selectedBtn: allBtn)
  }
  
  @IBAction func unreadBtn(_ sender: Any) {
      setButtonBackground(selectedBtn: unreadBtn)
  }
  
  @IBAction func favBtn(_ sender: Any) {
      setButtonBackground(selectedBtn: favBtn)
  }
  
  @IBAction func groupBtn(_ sender: Any) {
      setButtonBackground(selectedBtn: groupBtn)
  }
  
  func setupThreeDotBtn() {
    let action1 = UIAction(title: "Select chats", image: UIImage(systemName: "checkmark.circle")) { _ in
      print("select chats tapped")
    }
    
    // Create the menu
    let menu = UIMenu(title: "", children: [action1])
    
    // Create a custom view for the bar button item
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "threeDot"), for: .normal)
    button.tintColor = .label
    if #available(iOS 14.0, *) {
      button.showsMenuAsPrimaryAction = true
      button.menu = menu
    }
    
    threeDotBtn.customView = button
  }
  
  func setupSearchBar() {
    chatSearchBar.backgroundImage = UIImage()
    chatSearchBar.delegate = self
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    chatSearchBar.resignFirstResponder()
  }
  
  func setButtonBackground(selectedBtn: UIButton) {
    let buttons = [allBtn, unreadBtn, favBtn, groupBtn]
    
    for button in buttons {
      if button == selectedBtn {
        setupBtnGreenBgAndLabel(btn: button!)
        chatSearchBar.placeholder = "Search \(button?.currentTitle ?? "") chats"
      } else {
        setupBtnGreyBgAndLabel(btn: button!)
      }
    }
  }
  
  func setupChatTblView() {
    chatsTblView.delegate = self
    chatsTblView.dataSource = self
    chatsTblView.register(UINib(nibName: "ChatCell", bundle: .main), forCellReuseIdentifier: "ChatCell")
    updateTblViewHeight()
  }
  
  func updateTblViewHeight() {
    let noOfRows = tableView(chatsTblView, numberOfRowsInSection: chats.count)
    let height = CGFloat(noOfRows) * 100
    chatTblViewHeight.constant = height
  }
  
}


extension ChatsVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chats.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as? ChatCell else{
      return UITableViewCell()
    }
    
    let item = chats[indexPath.row]
    
    cell.profileImg.image = item.userImage
    cell.profileName.text = item.userName
    cell.lastMsg.text = item.userLastMsg
    cell.msgTimeorDate.text = item.lastMsgTimeOrDate
    
    if item.isMute == true {
      cell.muteNotificationImg.isHidden = false
    } else {
      cell.muteNotificationImg.isHidden = true
    }
    
    if item.unreadMsgCount == 0 {
      cell.msgCountView.isHidden = true
      cell.msgTimeorDate.textColor = UIColor.chatGrayLabel
    } else {
      cell.msgCountView.isHidden = false
      cell.msgsCount.text = "\(item.unreadMsgCount)"
    }
    
    
    
    cell.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}
