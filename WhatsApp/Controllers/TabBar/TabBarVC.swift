//
//  TabBarVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 27/08/2024.
//

import UIKit

class TabBarVC: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    selectedIndex = 1
    self.navigationItem.setHidesBackButton(true, animated: true)
  }
  
}
