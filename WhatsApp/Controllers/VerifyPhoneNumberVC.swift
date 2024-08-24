//
//  VerifyPhoneNumberVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 24/08/2024.
//

import UIKit
import CountryPickerView
import FlagPhoneNumber

class VerifyPhoneNumberVC: UIViewController {

  @IBOutlet weak var countryCodeTF: FPNTextField!
  @IBOutlet weak var countryPV: CountryPickerView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      self.navigationItem.setHidesBackButton(true, animated: true)
      
      countryPV.setCountryByName("PAK")
      countryPV.showCountryNameInView = true
      countryPV.showPhoneCodeInView = false
      countryPV.textColor = UIColor.label
      countryPV.countryDetailsLabel.textAlignment = .center
      countryPV.addBottomBorderView()
      
      countryCodeTF.setFlag(key: .PK)
      countryCodeTF.textColor = .label
      countryCodeTF.addBottomBorderTF()
    }

}

