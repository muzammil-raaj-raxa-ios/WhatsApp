//
//  EditProfilePicVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 07/09/2024.
//

import UIKit

class EditProfilePicVC: UIViewController {
  
  @IBOutlet weak var takeBtn: UIButton!
  @IBOutlet weak var chooseBtn: UIButton!
  @IBOutlet weak var deleteBtn: UIButton!
  @IBOutlet weak var canceBtn: UIButton!
  @IBOutlet weak var profileImg: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    profileImg.image = getProfileImg(forKey: "profileImage") ?? UIImage(systemName: "person.fill")
    canceBtn.setTitle("", for: .normal)
    canceBtn.layer.cornerRadius = canceBtn.frame.height / 2
    takeBtn.setTitle("", for: .normal)
    chooseBtn.setTitle("", for: .normal)
    deleteBtn.setTitle("", for: .normal)
  }
  
  
  @IBAction func cancelBtn(_ sender: Any) {
    dismiss(animated: true)
  }
  
  @IBAction func takePhotoBtn(_ sender: Any) {
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      let vc = UIImagePickerController()
      vc.delegate = self
      vc.sourceType = .camera
      vc.allowsEditing = true
      present(vc, animated: true)
    } else {
      alertMessage(message: "Give access to camera")
    }
  }
  
  @IBAction func choosePhotoBtn(_ sender: Any) {
    let vc = UIImagePickerController()
    vc.delegate = self
    vc.sourceType = .photoLibrary
    vc.allowsEditing = true
    present(vc, animated: true)
  }
  
  @IBAction func deletePhotoBtn(_ sender: Any) {
    let alert = UIAlertController(title: "Delete photo", message: "Are you sure you wanna delete your profile photo", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
    alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
      let image = UIImage(named: "person")!
      image.withTintColor(UIColor.LIGHTGRAY)
      self.profileImg.image = image
      setProfileImg(image, forKey: "profileImage")
      NotificationCenter.default.post(Notification(name: NSNotification.Name("ProfilePhotoUpdated"), object: nil))
    }))
    present(alert, animated: true, completion: nil)
  }
  
}

extension EditProfilePicVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
      profileImg.image = image
      setProfileImg(image, forKey: "profileImage")
      UserDefaults.standard.synchronize()
      
      NotificationCenter.default.post(Notification(name: NSNotification.Name("ProfilePhotoUpdated"), object: nil))
    }
    picker.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
}
