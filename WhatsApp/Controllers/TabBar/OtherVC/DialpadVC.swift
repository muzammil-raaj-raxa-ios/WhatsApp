//
//  DialpadVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 03/09/2024.
//

import UIKit

class DialpadVC: UIViewController {

  @IBOutlet weak var callBtn: UIButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    callBtn.setTitle("", for: .normal)
    }
  
  
  @IBAction func cancelBtn(_ sender: Any) {
    dismiss(animated: true)
  }
  
  
  @IBAction func addBtn(_ sender: Any) {
  }
  
}
