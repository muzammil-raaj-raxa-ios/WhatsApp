//
//  TermsAndServicesVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 24/08/2024.
//

import UIKit
import SafariServices

class TermsAndServicesVC: UIViewController {
  
  @IBOutlet weak var policyServicesLabel: UITextView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.setHidesBackButton(true, animated: true)
    navigationController?.navigationBar.prefersLargeTitles = false
    setupLabel()
  }
  
  
  @IBAction func agreeBtn(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    if let vc = storyboard.instantiateViewController(withIdentifier: "VerifyPhoneNumberVC") as? VerifyPhoneNumberVC {
      self.navigationController?.pushViewController(vc, animated: true)
    }
  }
  
  func setupLabel() {
    let labelText = "Read our Privacy Policy. Tap \"Agree and Continue\" to accept the Terms of Services."
    let attributedString = NSMutableAttributedString(string: labelText)
    
    let privacyPolicyRange = (labelText as NSString).range(of: "Privacy Policy")
    let termsOfServicesRange = (labelText as NSString).range(of: "Terms of Services")
    
    attributedString.addAttribute(.link, value: "https://www.whatsapp.com/legal/privacy-policy", range: privacyPolicyRange)
    attributedString.addAttribute(.link, value: "https://www.whatsapp.com/legal/terms-of-service", range: termsOfServicesRange)
    
    policyServicesLabel.attributedText = attributedString
    policyServicesLabel.isEditable = false
    policyServicesLabel.isScrollEnabled = false
    policyServicesLabel.textColor = UIColor(named: "LIGHTGRAY")
    policyServicesLabel.textAlignment = .center
    policyServicesLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    policyServicesLabel.dataDetectorTypes = []
    policyServicesLabel.delegate = self
  }
}

extension TermsAndServicesVC: UITextViewDelegate {
  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    let safariVC = SFSafariViewController(url: URL)
    safariVC.modalPresentationStyle = .overFullScreen
    present(safariVC, animated: true, completion: nil)
    return false
  }
}
