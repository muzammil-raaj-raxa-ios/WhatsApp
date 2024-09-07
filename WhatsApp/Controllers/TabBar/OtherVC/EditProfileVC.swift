//
//  EditProfileVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 06/09/2024.
//

import UIKit

class EditProfileVC: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var phoneNoLabel: UILabel!
  @IBOutlet weak var doneBtn: UIBarButtonItem!
  @IBOutlet weak var nameCharCountLabel: UILabel!
  @IBOutlet weak var nameTF: UITextField!
  @IBOutlet weak var profileImg: UIImageView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.prefersLargeTitles = false
    profileImg.layer.cornerRadius = profileImg.frame.height / 2
    profileImg.image = getProfileImg(forKey: "profileImage")
    if #available(iOS 16.0, *) {
      doneBtn.isHidden = true
    }
    setupNameView()
    nameCharCountLabel.isHidden = true
    phoneNoLabel.text = UserDefaults.standard.string(forKey: "phoneNo")
  }
  
  
  @IBAction func backBtn(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  @IBAction func doneBtn(_ sender: Any) {
    nameTF.resignFirstResponder()
    nameCharCountLabel.isHidden = true
    UserDefaults.standard.setValue(nameTF.text, forKey: "userName")
    UserDefaults.standard.synchronize()
  }
  
  
  @IBAction func profilePhotoBtn(_ sender: Any) {
    let storyboard = UIStoryboard(name: "OtherVC", bundle: .main)
    if let vc = storyboard.instantiateViewController(withIdentifier: "ProfilePhotoVC") as? ProfilePhotoVC {
      vc.hidesBottomBarWhenPushed = true
      self.navigationController?.pushViewController(vc, animated: true)
    }
  }
  
  
  func setupNameView() {
    nameTF.delegate = self
    nameTF.addTarget(self, action: #selector(nameTextfieldDidChange(_:)), for: .editingChanged)
    nameTF.text = UserDefaults.standard.string(forKey: "userName")
    setupNameTF()
  }
  
  func setupNameTF() {
    nameTF.spellCheckingType = .no
    nameCharCountLabel.isHidden = (nameTF.text?.count ?? 0) < 1
    let count = 25 - (nameTF.text?.count ?? 0)
    nameCharCountLabel.text = "\(count)"
    DispatchQueue.main.async {
      if count <= 0 {
        self.nameCharCountLabel.isHidden = true
      } else {
        self.nameCharCountLabel.textColor = UIColor.LIGHTGRAY
      }
    }
    UserDefaults.standard.setValue(nameTF.text, forKey: "userName")
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    nameTF.resignFirstResponder()
    nameCharCountLabel.isHidden = true
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let currentText = textField.text else {
      return true
    }
    
    let newLength = currentText.count + string.count - range.length
    
    if #available(iOS 16.0, *) {
      doneBtn.isHidden = false
    }
    
    return newLength <= 25
  }
  
  @objc func nameTextfieldDidChange(_ textfield: UITextField) {
    setupNameTF()
  }
  
}
