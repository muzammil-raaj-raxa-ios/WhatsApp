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

  
  func setupProfileImg() {
    profileImg.image = getProfileImg(forKey: "profileImage") ?? UIImage(systemName: "person.fill")
    profileScrollView.minimumZoomScale = 1.0
    profileScrollView.maximumZoomScale = 5.0
    profileScrollView.delegate = self
  }
  
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return profileImg
  }
  
}
