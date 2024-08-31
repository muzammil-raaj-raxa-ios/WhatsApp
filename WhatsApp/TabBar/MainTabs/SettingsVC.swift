//
//  SettingsVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 27/08/2024.
//

import UIKit

class SettingsVC: UIViewController, UISearchBarDelegate {
  
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
  }
  
  @IBAction func logoutBtn(_ sender: Any) {
    let alert = UIAlertController(title: "Log Out", message: "Are you sure you want to Log out ?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
    alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
      UserDefaults.standard.removeObject(forKey: "userName")
      UserDefaults.standard.removeObject(forKey: "profileImage")
      DispatchQueue.main.async {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TermsAndServicesVC") as? TermsAndServicesVC {
          vc.hidesBottomBarWhenPushed = true
          self.navigationController?.pushViewController(vc, animated: true)
        }
      }
    }))
    present(alert, animated: true)
    print("logout")
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
