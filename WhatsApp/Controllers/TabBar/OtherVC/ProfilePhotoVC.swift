//
//  ProfilePhotoVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 06/09/2024.
//

import UIKit

class ProfilePhotoVC: UIViewController, UIScrollViewDelegate {
  
  @IBOutlet weak var shareBtn: UIButton!
  @IBOutlet weak var profileScrollView: UIScrollView!
  @IBOutlet weak var profileImg: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupProfileImg()
    shareBtn.setTitle("", for: .normal)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    setupProfileImg()
    NotificationCenter.default.addObserver(self, selector: #selector(updateProfilePic), name: NSNotification.Name("ProfilePhotoUpdated"), object: nil)
    profileImg.tintColor = UIColor.LIGHTGRAY
  }
  
  @IBAction func backBtn(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func editBtn(_ sender: Any) {
    let storyboard = UIStoryboard(name: "OtherVC", bundle: nil)
    if let vc = storyboard.instantiateViewController(withIdentifier: "EditProfilePicVC") as? EditProfilePicVC {
      if #available(iOS 15.0, *) {
        if let presentationVC = vc.presentationController as? UISheetPresentationController {
          if #available(iOS 16.0, *) {
            presentationVC.detents = [.custom(resolver: { context in
              300
            })]
          }
        }
      }
      present(vc, animated: true)
    }
    
  }
  
  
  @IBAction func shareBtn(_ sender: Any) {
    if #available(iOS 14.0, *) {
      shareBtn.showsMenuAsPrimaryAction = true
    }
    let action1 = UIAction(title: "Save Image", image: UIImage(systemName: "square.and.arrow.down"), handler: { _ in
      if let image = getProfileImg(forKey: "profileImage") {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.alertMessage(message: "Image saved to photos")
      } else {
        self.alertMessage(message: "Image does not saved to photos")
      }
      print("Save image tapped")
    })
    
    let action2 = UIAction(title: "Copy", image: UIImage(systemName: "doc.on.doc"), handler: { _ in
      if let image = getProfileImg(forKey: "profileImage") {
        UIPasteboard.general.image = image
        self.alertMessage(message: "Image copied to clipboard")
      } else {
        self.alertMessage(message: "Image does not copied to clipboard")
      }
      
      print("Copy image tapped")
    })
    
    let menus = UIMenu(title: "", children: [action2, action1])
    
    if #available(iOS 14.0, *) {
      shareBtn.menu = menus
    }
  }
  
  
  func setupProfileImg() {
    profileImg.image = getProfileImg(forKey: "profileImage")
    profileScrollView.minimumZoomScale = 1.0
    profileScrollView.maximumZoomScale = 5.0
    profileScrollView.delegate = self
  }
  
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return profileImg
  }
  
  @objc func updateProfilePic() {
    setupProfileImg()
  }
  
}
