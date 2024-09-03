//
//  CallsVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 03/09/2024.
//

import UIKit

class CallsVC: UIViewController, UISearchBarDelegate {
  
  @IBOutlet weak var callSearchBar: UISearchBar!
  @IBOutlet weak var threeDotBtn: UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.prefersLargeTitles = true
    self.title = "Calls"
    setupThreeDotBtn()
    setupSearchBar()
  }
  
  @IBAction func diapadBtn(_ sender: Any) {
    let storyboard = UIStoryboard(name: "OtherVC", bundle: nil)
    if let vc = storyboard.instantiateViewController(withIdentifier: "DialpadVC") as? DialpadVC {
      vc.modalPresentationStyle = .formSheet
      present(vc, animated: true)
    }
  }
  
  
  func setupThreeDotBtn() {
    let action1 = UIAction(title: "Edit", image: UIImage(systemName: "pencil.line")) { _ in
      print("Edit btn tapped")
    }
    
    // Create the menu
    let menu = UIMenu(title: "", children: [action1])
    
    // Create a custom view for the bar button item
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "threeDot"), for: .normal)
    button.tintColor = .label
    if #available(iOS 14.0, *) {
      button.showsMenuAsPrimaryAction = true
      button.menu = menu
    }
    
    threeDotBtn.customView = button
  }
  
  func setupSearchBar() {
    callSearchBar.backgroundImage = UIImage()
    callSearchBar.delegate = self
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    callSearchBar.resignFirstResponder()
  }
  
}
