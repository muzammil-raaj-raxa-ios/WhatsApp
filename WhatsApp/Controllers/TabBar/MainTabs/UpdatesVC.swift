//
//  UpdatesVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 04/09/2024.
//

import UIKit

class UpdatesVC: UIViewController, UISearchBarDelegate {
  
  @IBOutlet weak var statusTblViewHeight: NSLayoutConstraint!
  @IBOutlet weak var statusTblView: UITableView!
  @IBOutlet weak var threeDotBtn: UIBarButtonItem!
  @IBOutlet weak var updateSearchBar: UISearchBar!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupThreeDotBtn()
    setupSearchBar()
    setupStatusTblView()
  }
  
  func setupThreeDotBtn() {
    let action1 = UIAction(title: "Create Channel", image: UIImage(systemName: "antenna.radiowaves.left.and.right.circle.fill")) { _ in
      print("Edit btn tapped")
    }
    let action2 = UIAction(title: "Status Privacy", image: UIImage(systemName: "lock.fill")) { _ in
      print("Edit btn tapped")
    }
    
    // Create the menu
    let menu = UIMenu(title: "", children: [action1, action2])
    
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
    updateSearchBar.backgroundImage = UIImage()
    updateSearchBar.delegate = self
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    updateSearchBar.resignFirstResponder()
  }
  
  func setupStatusTblView() {
    statusTblView.delegate = self
    statusTblView.dataSource = self
    statusTblView.register(UINib(nibName: "StatusCell", bundle: .main), forCellReuseIdentifier: "StatusCell")
    updateTblViewHeight()
  }
  
  func updateTblViewHeight() {
    let noOfRows = tableView(statusTblView, numberOfRowsInSection: statuses.count)
    let height = CGFloat(noOfRows) * 80
    statusTblViewHeight.constant = height
  }
  
  
}


extension UpdatesVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return statuses.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatusCell", for: indexPath) as? StatusCell else{ return UITableViewCell() }
    
    let item = statuses[indexPath.row]
    
    cell.statusImg.image = item.statusImg
    cell.statusName.text = item.statusName
    cell.statusTime.text = item.statusTime
    
    cell.configure(with: item)
    print(cell.configure(with: item))
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  
}
