//
//  UpdatesVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 04/09/2024.
//

import UIKit

class UpdatesVC: UIViewController, UISearchBarDelegate {
  
  @IBOutlet weak var channelView: UIView!
  @IBOutlet weak var channelUpDownImg: UIImageView!
  @IBOutlet weak var channelTblView: UITableView!
  @IBOutlet weak var mutedStatusTblViewHeight: NSLayoutConstraint!
  @IBOutlet weak var mutedStatusTblView: UITableView!
  @IBOutlet weak var mutedStatusView: UIView!
  @IBOutlet weak var mutedUpDownImg: UIImageView!
  @IBOutlet weak var viewedStatusTblViewHeight: NSLayoutConstraint!
  @IBOutlet weak var viewedStatusTblView: UITableView!
  @IBOutlet weak var viewedStatusView: UIView!
  @IBOutlet weak var viewedUpDownImg: UIImageView!
  @IBOutlet weak var statusTblViewHeight: NSLayoutConstraint!
  @IBOutlet weak var statusTblView: UITableView!
  @IBOutlet weak var threeDotBtn: UIBarButtonItem!
  @IBOutlet weak var updateSearchBar: UISearchBar!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupThreeDotBtn()
    setupSearchBar()
    setupStatusTblView()
    setupviewedStatusTblView()
    setupMutedStatusTblView()
    setupChannelTblView()
    viewedStatusView.isHidden = true
    mutedStatusView.isHidden = true
    channelView.isHidden = true
  }
  
  @IBAction func viewedStatusUpDownBtn(_ sender: Any) {
    if viewedUpDownImg.image == UIImage(systemName: "chevron.down") {
      viewedUpDownImg.image = UIImage(systemName: "chevron.up")
      viewedStatusView.isHidden = false
    } else {
      viewedUpDownImg.image = UIImage(systemName: "chevron.down")
      viewedStatusView.isHidden = true
    }
  }
  
  
  @IBAction func mutedStatusUpDownBtn(_ sender: Any) {
    if mutedUpDownImg.image == UIImage(systemName: "chevron.down") {
      mutedUpDownImg.image = UIImage(systemName: "chevron.up")
      mutedStatusView.isHidden = false
    } else {
      mutedUpDownImg.image = UIImage(systemName: "chevron.down")
      mutedStatusView.isHidden = true
    }
  }
  
  
  @IBAction func channelUpDownBtn(_ sender: Any) {
    if channelUpDownImg.image == UIImage(systemName: "chevron.down") {
      channelUpDownImg.image = UIImage(systemName: "chevron.up")
      channelView.isHidden = false
    } else {
      channelUpDownImg.image = UIImage(systemName: "chevron.down")
      channelView.isHidden = true
    }
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
    updateStatusTblViewHeight()
  }
  
  func setupviewedStatusTblView() {
    viewedStatusTblView.delegate = self
    viewedStatusTblView.dataSource = self
    viewedStatusTblView.register(UINib(nibName: "StatusCell", bundle: .main), forCellReuseIdentifier: "StatusCell")
    updateViewedStatusTblViewHeight()
  }
  
  func setupMutedStatusTblView() {
    mutedStatusTblView.delegate = self
    mutedStatusTblView.dataSource = self
    mutedStatusTblView.register(UINib(nibName: "StatusCell", bundle: .main), forCellReuseIdentifier: "StatusCell")
    updateMutedStatusTblViewHeight()
  }
  
  func setupChannelTblView() {
    channelTblView.delegate = self
    channelTblView.dataSource = self
    channelTblView.register(UINib(nibName: "ChannelCell", bundle: .main), forCellReuseIdentifier: "ChannelCell")
  }
  
  func updateStatusTblViewHeight() {
    let noOfRows = tableView(statusTblView, numberOfRowsInSection: statuses.count)
    let height = CGFloat(noOfRows) * 80
    statusTblViewHeight.constant = height
  }
  
  func updateViewedStatusTblViewHeight() {
    let noOfRows = tableView(viewedStatusTblView, numberOfRowsInSection: viewStatuses.count)
    let height = CGFloat(noOfRows) * 80
    viewedStatusTblViewHeight.constant = height
  }
  
  func updateMutedStatusTblViewHeight() {
    let noOfRows = tableView(mutedStatusTblView, numberOfRowsInSection: mutedStatuses.count)
    let height = CGFloat(noOfRows) * 80
    mutedStatusTblViewHeight.constant = height
  }
  
  
}


extension UpdatesVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == statusTblView {
      return statuses.count
    } else if tableView == viewedStatusTblView {
      return viewStatuses.count
    } else if tableView == mutedStatusTblView {
      return mutedStatuses.count
    } else if tableView == channelTblView {
      return 5
    }
    
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == statusTblView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatusCell", for: indexPath) as? StatusCell else{ return UITableViewCell() }
      
      let item = statuses[indexPath.row]
      
      cell.statusImg.image = item.statusImg
      cell.statusName.text = item.statusName
      cell.statusTime.text = item.statusTime
      
      cell.configure(with: item)
      
      return cell
    } else if tableView == viewedStatusTblView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatusCell", for: indexPath) as? StatusCell else{ return UITableViewCell() }
      
      let item = viewStatuses[indexPath.row]
      
      cell.statusImg.image = item.statusImg
      cell.statusName.text = item.statusName
      cell.statusTime.text = item.statusTime
      
      cell.configure(with: item)
      
      return cell
    } else if tableView == mutedStatusTblView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatusCell", for: indexPath) as? StatusCell else{ return UITableViewCell() }
      
      let item = statuses[indexPath.row]
      
      cell.statusImg.image = item.statusImg
      cell.statusName.text = item.statusName
      cell.statusTime.text = item.statusTime
      
      cell.configure(with: item)
      
      return cell
    } else if tableView == channelTblView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelCell", for: indexPath) as? ChannelCell else{ return UITableViewCell() }
      
      
      return cell
    }
    
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == statusTblView {
      var status = statuses[indexPath.row]
      
      if status.newStatus > 0 {
        status.newStatus -= 1
      }
      
      if status.newStatus == 0 {
        statuses.remove(at: indexPath.row)
        viewStatuses.append(status)
        
        updateStatusTblViewHeight()
        updateViewedStatusTblViewHeight()
        
        statusTblView.reloadData()
        viewedStatusTblView.reloadData()
      } else {
        statuses[indexPath.row] = status
        
        if let cell = tableView.cellForRow(at: indexPath) as? StatusCell {
          cell.configure(with: status)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
      }
    }
  }
  
}
