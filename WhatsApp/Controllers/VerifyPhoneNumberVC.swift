//
//  VerifyPhoneNumberVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 24/08/2024.
//

import UIKit
import CountryPickerView
import FlagPhoneNumber

protocol getPhoneNumberDelegate: AnyObject {
  func getPhoneNo(phoneNO: String)
}

class VerifyPhoneNumberVC: UIViewController {
  
  @IBOutlet weak var phoneNoTF: FPNTextField!
  @IBOutlet weak var countryPV: CountryPickerView!
  
  weak var delegate: getPhoneNumberDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.setHidesBackButton(true, animated: true)
    setupCountryPickerView()
    setupPhoneNoTF()
    countryPV.setCountryByCode("PK")
    
    if #available(iOS 13.0, *) {
      let appearance = UINavigationBarAppearance()
      appearance.configureWithOpaqueBackground()
      appearance.backgroundColor = UIColor.BLACKWHITE
      appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
      self.navigationController?.navigationBar.standardAppearance = appearance
      self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
  }
  
  
  @IBAction func verifyBtn(_ sender: Any) {
    guard let phoneNO = phoneNoTF.text, !phoneNO.isEmpty else {
      alertMessage(message: "Phone number cannot be Empty!")
      return
    }
    
    let countryCode = phoneNoTF.selectedCountry?.phoneCode ?? ""
    let fullPhoneNO = "\(countryCode) \(phoneNO)"
    UserDefaults.standard.setValue(fullPhoneNO, forKey: "phoneNo")
    
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    if let vc = storyboard.instantiateViewController(withIdentifier: "OtpVerificationVC") as? OtpVerificationVC {
      vc.phoneNo = fullPhoneNO
      self.navigationController?.pushViewController(vc, animated: true)
    }
  }
  
  func setupCountryPickerView() {
    countryPV.setCountryByCode("PK")
    countryPV.showCountryNameInView = true
    countryPV.showPhoneCodeInView = false
    countryPV.textColor = UIColor.label
    countryPV.countryDetailsLabel.textAlignment = .center
    countryPV.addBottomBorderView(color: UIColor.GREEN)
    countryPV.delegate = self
  }
  
  func setupPhoneNoTF() {
    phoneNoTF.setFlag(key: .PK)
    phoneNoTF.textColor = .label
    phoneNoTF.addBottomBorderTF()
    phoneNoTF.placeholder = "Enter you mobile number"
    phoneNoTF.becomeFirstResponder()
  }
  
}

extension VerifyPhoneNumberVC: CountryPickerViewDelegate {
  func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
    if let countryCode = FPNCountryCode(rawValue: country.code) {
      phoneNoTF.setFlag(countryCode: countryCode)
    }
    phoneNoTF.set(phoneNumber: country.phoneCode)
  }
}
