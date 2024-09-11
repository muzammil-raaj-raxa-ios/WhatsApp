//
//  CustomBioVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 10/09/2024.
//

import UIKit

protocol NewlyAddedBioDelegate: AnyObject {
  func newBio(_ bio: String)
}

class CustomBioVC: UIViewController, UITextViewDelegate {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bioTextview: UITextView!
  
  let maxBioLength = 139
  weak var delegate: NewlyAddedBioDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavTitle()
    setupTextview()
    bioTextview.delegate = self
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @IBAction func cancelBtn(_ sender: Any) {
    dismiss(animated: true)
  }
  
  
  @IBAction func saveBtn(_ sender: Any) {
    UserDefaults.standard.setValue(bioTextview.text, forKey: "userBio")
    delegate?.newBio(bioTextview.text)
    dismiss(animated: true)
  }
  
  func setupNavTitle() {
    let titleCount = 139 - bioTextview.text.count
    titleLabel.text = "Bio (\(titleCount))"
  }
  
  func setupTextview() {
    let currentBio = UserDefaults.standard.object(forKey: "userBio")
    bioTextview.text = currentBio as? String
    setupNavTitle()
    bioTextview.becomeFirstResponder()
  }
  
  func textViewDidChange(_ textView: UITextView) {
    setupNavTitle()
  }
  
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    let currentText = bioTextview.text!
    let newlyAddedBio = (currentText as NSString).replacingCharacters(in: range, with: text)
    
    return newlyAddedBio.count <= maxBioLength
  }
  
  @objc func keyboardWillShow(notification: NSNotification) {
    self.view.frame.origin.y = 0
  }
  
  @objc func keyboardWillHide(notification: NSNotification) {
    self.view.frame.origin.y = 0
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  
}
