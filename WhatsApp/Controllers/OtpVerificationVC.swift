//
//  OtpVerificationVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 25/08/2024.
//

import UIKit

class OtpVerificationVC: UIViewController {
  
  var phoneNo: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

      self.navigationItem.setHidesBackButton(true, animated: true)
      self.title = "Verify \(phoneNo)"
      
      let appearence = UINavigationBarAppearance()
      appearence.titleTextAttributes = [.foregroundColor: UIColor.GREEN]
      navigationItem.standardAppearance = appearence                                             
    }

}
