//
//  ProfileInfoVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 26/08/2024.
//

import UIKit

class ProfileInfoVC: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var nameView: UIView!
  @IBOutlet weak var nameCharCountLabel: UILabel!
  @IBOutlet weak var nameTF: UITextField!
  @IBOutlet weak var profileView: UIView!
  @IBOutlet weak var profileBtn: UIButton!
  @IBOutlet weak var userProfileImg: UIImageView!
  @IBOutlet weak var defaultProfileImg: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.setHidesBackButton(true, animated: true)
    profileBtn.setTitle("", for: .normal)
    setupImg()
    nameView.addBottomBorderView(color: UIColor.GREEN)
    setupNameView()
  }
  
  @IBAction func profileImgBtn(_ sender: Any) {
    let vc = UIImagePickerController()
    vc.delegate = self
    vc.sourceType = .photoLibrary
    vc.allowsEditing = true
    present(vc, animated: true)
  }
  
  func setupImg() {
    defaultProfileImg.layer.cornerRadius = defaultProfileImg.frame.size.width / 2
    defaultProfileImg.layer.masksToBounds = true
    userProfileImg.isHidden = true
    userProfileImg.layer.cornerRadius = userProfileImg.frame.size.width / 2
    userProfileImg.layer.masksToBounds = true
  }
  
  func setupNameView() {
    nameTF.delegate = self
    nameTF.addTarget(self, action: #selector(nameTextfieldDidChange(_:)), for: .editingChanged)
    setupNameTF()
  }
  
  func setupNameTF() {
    nameCharCountLabel.isHidden = (nameTF.text?.count ?? 0) < 1
    let count = 25 - (nameTF.text?.count ?? 0)
    nameCharCountLabel.text = "\(count)"
    DispatchQueue.main.async {
      if count < 0 {
        self.nameCharCountLabel.textColor = UIColor.red
      } else {
        self.nameCharCountLabel.textColor = UIColor.LIGHTGRAY
      }
    }
    
  }
  
  @objc func nameTextfieldDidChange(_ textfield: UITextField) {
    setupNameTF()
  }
}


extension ProfileInfoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
      userProfileImg.image = image
      userProfileImg.isHidden = false
      defaultProfileImg.isHidden = true
      profileView.backgroundColor = .clear
    }
    picker.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
}
