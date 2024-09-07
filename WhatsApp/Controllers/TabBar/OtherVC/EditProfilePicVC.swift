//
//  EditProfilePicVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 07/09/2024.
//

import UIKit

class EditProfilePicVC: UIViewController {

  @IBOutlet weak var canceBtn: UIButton!
  @IBOutlet weak var profileImg: UIImageView!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    profileImg.image = getProfileImg(forKey: "profileImage") ?? UIImage(systemName: "person.fill")
    canceBtn.setTitle("", for: .normal)
    canceBtn.layer.cornerRadius = canceBtn.frame.height / 2
    }
  
  
  @IBAction func cancelBtn(_ sender: Any) {
    dismiss(animated: true)
  }
  
  @IBAction func takePhotoBtn(_ sender: Any) {
  }
  
  @IBAction func choosePhotoBtn(_ sender: Any) {
    let vc = UIImagePickerController()
    vc.delegate = self
    vc.sourceType = .photoLibrary
    vc.allowsEditing = true
    present(vc, animated: true)
  }
  
  @IBAction func deletePhotoBtn(_ sender: Any) {
  }
  
}

extension EditProfilePicVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
      profileImg.image = image
      setProfileImg(image, forKey: "profileImage")
      UserDefaults.standard.synchronize()
    }
    picker.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
}
