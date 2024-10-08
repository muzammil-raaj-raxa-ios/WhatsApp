//
//  SettingsVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 27/08/2024.
//

import UIKit

class SettingsVC: UIViewController, UISearchBarDelegate {
  
  @IBOutlet weak var logoutBtn: UIButton!
  @IBOutlet weak var bioLabel: UILabel!
  @IBOutlet weak var fourthSettingTblView: UITableView!
  @IBOutlet weak var thirdSettingTblView: UITableView!
  @IBOutlet weak var secondSettingTblView: UITableView!
  @IBOutlet weak var firstSettingTblView: UITableView!
  @IBOutlet weak var profileBio: UILabel!
  @IBOutlet weak var profileName: UILabel!
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var settingSearchBar: UISearchBar!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    settingSearchBar.backgroundImage = UIImage()
    settingSearchBar.delegate = self
    setupProfile()
    setupFirstSettingTblView()
    setupSecondSettingTblView()
    setupThirdSettingTblView()
    setupFourthSettingTblView()
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.largeTitleDisplayMode = .always
    bioLabel.text = UserDefaults.standard.string(forKey: "userBio") ?? "Hey there! I am using Whatsapp"
    logoutBtn.setTitle("", for: .normal)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.largeTitleDisplayMode = .always
    
    setupProfile()
    bioLabel.text = UserDefaults.standard.string(forKey: "userBio") ?? "Hey there! I am using Whatsapp"
  }
  
  @IBAction func logoutBtn(_ sender: Any) {
    let alert = UIAlertController(title: "Log Out", message: "Are you sure you want to Log out ?", preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
    alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
      UserDefaults.standard.removeObject(forKey: "userName")
      UserDefaults.standard.removeObject(forKey: "profileImage")
      UserDefaults.standard.removeObject(forKey: "userBio")
      DispatchQueue.main.async {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TermsAndServicesVC") as? TermsAndServicesVC {
          vc.hidesBottomBarWhenPushed = true
          self.navigationController?.pushViewController(vc, animated: true)
        }
      }
    }))
    
    // Check if the device is iPad and set the source for the popoverPresentationController
    if let popoverController = alert.popoverPresentationController {
      popoverController.sourceView = self.view // or sender (e.g., UIButton)
      popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
      popoverController.permittedArrowDirections = []
    }
    
    present(alert, animated: true)
    getHapticFeedback()
    print("logout")
  }
  
  
  @IBAction func editProfileBtn(_ sender: Any) {
    let storyboard = UIStoryboard(name: "OtherVC", bundle: .main)
    if let vc = storyboard.instantiateViewController(withIdentifier: "EditProfileVC") as? EditProfileVC {
      vc.hidesBottomBarWhenPushed = false
      self.navigationController?.pushViewController(vc, animated: true)
    }
    print("Edit profile tapped")
  }
  
  func setupProfile() {
    profileName.text = UserDefaults.standard.string(forKey: "userName")
    let profileImg = getProfileImg(forKey: "profileImage")
    profileImage.image = profileImg
    profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
    profileImage.layer.masksToBounds = true
  }
  
  func setupFirstSettingTblView() {
    firstSettingTblView.delegate = self
    firstSettingTblView.dataSource = self
    firstSettingTblView.register(UINib(nibName: "SettingCell", bundle: .main), forCellReuseIdentifier: "SettingCell")
  }
  
  func setupSecondSettingTblView() {
    secondSettingTblView.delegate = self
    secondSettingTblView.dataSource = self
    secondSettingTblView.register(UINib(nibName: "SettingCell", bundle: .main), forCellReuseIdentifier: "SettingCell")
  }
  
  func setupThirdSettingTblView() {
    thirdSettingTblView.delegate = self
    thirdSettingTblView.dataSource = self
    thirdSettingTblView.register(UINib(nibName: "SettingCell", bundle: .main), forCellReuseIdentifier: "SettingCell")
  }
  
  func setupFourthSettingTblView() {
    fourthSettingTblView.delegate = self
    fourthSettingTblView.dataSource = self
    fourthSettingTblView.register(UINib(nibName: "SettingCell", bundle: .main), forCellReuseIdentifier: "SettingCell")
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    settingSearchBar.resignFirstResponder()
    
    guard let searchText = searchBar.text?.lowercased() else {return}
    
    searchBar.text = ""
    
    print(searchText)
    switch searchText.lowercased() {
    case "profilephoto", "photo", "userphoto", "pic", "dp":
      let storyboard = UIStoryboard(name: "OtherVC", bundle: .main)
      if let vc = storyboard.instantiateViewController(withIdentifier: "ProfilePhotoVC") as? ProfilePhotoVC {
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
      }
    case "name", "username", "profilename":
      let storyboard = UIStoryboard(name: "OtherVC", bundle: .main)
      if let vc = storyboard.instantiateViewController(withIdentifier: "EditProfileVC") as? EditProfileVC {
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
      }
    case "bio", "about", "currentbio", "currentabout":
      let storyboard = UIStoryboard(name: "OtherVC", bundle: .main)
      if let vc = storyboard.instantiateViewController(withIdentifier: "BioVC") as? BioVC {
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
      }
    default:
      alertMessage(message: "No such thing as \(searchText)")
    }
  }
  
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == firstSettingTblView {
      return 4
    } else if tableView == secondSettingTblView {
      return 5
    } else if tableView == thirdSettingTblView {
      return 2
    } else if tableView == fourthSettingTblView {
      return 2
    }
    
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == firstSettingTblView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingCell else {
        return UITableViewCell()
      }
      
      let item = firstSettingTblViewItem[indexPath.row]
      cell.settingImage.image = item.image
      cell.settingName.text = item.name
      cell.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
      
      return cell
    } else if tableView == secondSettingTblView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingCell else {
        return UITableViewCell()
      }
      
      let item = secondSettingTblViewItem[indexPath.row]
      cell.settingImage.image = item.image
      cell.settingName.text = item.name
      cell.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
      
      return cell
    } else if tableView == thirdSettingTblView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingCell else {
        return UITableViewCell()
      }
      
      let item = thirdSettingTblViewItem[indexPath.row]
      cell.settingImage.image = item.image
      cell.settingName.text = item.name
      cell.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
      
      return cell
    } else if tableView == fourthSettingTblView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingCell else {
        return UITableViewCell()
      }
      
      let item = fourthSettingTblViewItem[indexPath.row]
      cell.settingImage.image = item.image
      cell.settingName.text = item.name
      cell.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
      
      return cell
    }
    
    
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 52
  }
}
