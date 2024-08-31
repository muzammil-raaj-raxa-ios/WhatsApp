//
//  ViewController.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 24/08/2024.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      if (UserDefaults.standard.value(forKey: "userName") != nil) {
        let storyboard = UIStoryboard(name: "TabBarVC", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC {
          vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true, completion: nil)
        }
      } else {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TermsAndServicesVC") as? TermsAndServicesVC {
          self.navigationController?.pushViewController(vc, animated: false)
        }
      }
      
    }
  }
  
  
}

