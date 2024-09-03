//
//  CallsVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 03/09/2024.
//

import UIKit

class CallsVC: UIViewController, UISearchBarDelegate {
  
  @IBOutlet weak var callTblViewHeight: NSLayoutConstraint!
  @IBOutlet weak var callTblView: UITableView!
  @IBOutlet weak var callSearchBar: UISearchBar!
  @IBOutlet weak var threeDotBtn: UIBarButtonItem!
  
  var filteredCalls: [CallModel] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.prefersLargeTitles = true
    self.title = "Calls"
    setupThreeDotBtn()
    setupSearchBar()
    filteredCalls = calls
    setupCallTblView()
    callTblView.reloadData()
  }
  
  @IBAction func diapadBtn(_ sender: Any) {
    let storyboard = UIStoryboard(name: "OtherVC", bundle: nil)
    if let vc = storyboard.instantiateViewController(withIdentifier: "DialpadVC") as? DialpadVC {
      vc.modalPresentationStyle = .formSheet
      present(vc, animated: true)
    }
  }
  
  
  @IBAction func segmentedControlBtn(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      filteredCalls = calls
      print("All btn")
    case 1:
      filteredCalls = calls.filter{ $0.callingStatusName == "Missed" }
      print("missed")
    default:
      filteredCalls = calls
      print("All btn")
    }
    
    callTblView.reloadData()
    updateTblViewHeight()
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
  
  func setupCallTblView() {
    callTblView.delegate = self
    callTblView.dataSource = self
    callTblView.register(UINib(nibName: "CallCell", bundle: .main), forCellReuseIdentifier: "CallCell")
    updateTblViewHeight()
  }
  
  func updateTblViewHeight() {
    let noOfRows = tableView(callTblView, numberOfRowsInSection: filteredCalls.count)
    let height = CGFloat(noOfRows) * 70
    callTblViewHeight.constant = height
  }
  
}


extension CallsVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredCalls.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CallCell", for: indexPath) as? CallCell else{ return UITableViewCell() }
    
    let item = filteredCalls[indexPath.row]
    
    cell.callerImg.image = item.callerImage
    cell.callerName.text = item.callerName
    cell.callingStatusImg.image = item.callingStatusImg
    cell.callingStatusName.text = item.callingStatusName
    cell.callDateOrTime.text = item.callTimeOrDate
    
    if cell.callingStatusName.text == "Missed" {
      cell.callerName.textColor = UIColor.red
    }
    
    cell.separatorInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 0)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }
  
}
