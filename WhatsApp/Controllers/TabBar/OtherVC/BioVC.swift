//
//  BioVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 09/09/2024.
//

import UIKit

class BioVC: UIViewController, UIGestureRecognizerDelegate {
  
  @IBOutlet weak var bioTableView: UITableView!
  @IBOutlet weak var currentBioLabel: UILabel!
  
  var selectedIndexPath: IndexPath?
  
  var bios: [BiosModel] = [
    BiosModel(bioText: "Hey there! I am using WhatsApp"),
    BiosModel(bioText: "Available"),
    BiosModel(bioText: "Busy"),
    BiosModel(bioText: "At school"),
    BiosModel(bioText: "At the movies"),
    BiosModel(bioText: "At work"),
    BiosModel(bioText: "Battery about to die"),
    BiosModel(bioText: "Can't talk, WhatsApp only"),
    BiosModel(bioText: "In a meeting"),
    BiosModel(bioText: "At the gym"),
    BiosModel(bioText: "Sleeping"),
    BiosModel(bioText: "Urgent calls only"),
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupBioTableView()
    setupIndexPath()
  }
  
  @IBAction func backBtn(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  func setupBioTableView() {
    bioTableView.delegate = self
    bioTableView.dataSource = self
    bioTableView.register(UINib(nibName: "BioCell", bundle: .main), forCellReuseIdentifier: "BioCell")
  }
  
  func setupIndexPath() {
    if UserDefaults.standard.string(forKey: "userBio") == nil {
      let firstIndexpath = IndexPath(row: 0, section: 0)
      selectedIndexPath = firstIndexpath
      
      let firstBio = bios[firstIndexpath.row].bioText
      currentBioLabel.text = firstBio
      UserDefaults.standard.setValue(firstBio, forKey: "userBio")
      UserDefaults.standard.setValue(firstIndexpath.row, forKey: "selectedRow")
      UserDefaults.standard.setValue(firstIndexpath.section, forKey: "selectedSection")
      
      bioTableView.selectRow(at: firstIndexpath, animated: false, scrollPosition: .none)
      bioTableView.deselectRow(at: firstIndexpath, animated: false)
      bioTableView.reloadRows(at: [firstIndexpath], with: .none)
    } else {
      let storedRow = UserDefaults.standard.integer(forKey: "selectedRow")
      let storedSection = UserDefaults.standard.integer(forKey: "selectedSection")
      let storedIndexPath = IndexPath(row: storedRow, section: storedSection)
      
      selectedIndexPath = storedIndexPath
      
      currentBioLabel.text = UserDefaults.standard.string(forKey: "userBio")
      
      bioTableView.selectRow(at: storedIndexPath, animated: false, scrollPosition: .none)
      bioTableView.deselectRow(at: storedIndexPath, animated: false)
      bioTableView.reloadRows(at: [storedIndexPath], with: .none)
    }
    
  }
  
}


extension BioVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bios.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "BioCell") as? BioCell else {
      return UITableViewCell()
    }
    
    let item = bios[indexPath.row]
    cell.bioLabel.text = item.bioText
    
    
    if selectedIndexPath == indexPath  {
      cell.accessoryType = .checkmark
      currentBioLabel.text = item.bioText
      UserDefaults.standard.setValue(item.bioText, forKey: "userBio")
    } else {
      cell.accessoryType = .none
    }
    
    
    cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let previousIndexPath = selectedIndexPath
    
    selectedIndexPath = indexPath
    
    let selectedBio = bios[indexPath.row].bioText
    currentBioLabel.text = selectedBio
    UserDefaults.standard.setValue(selectedBio, forKey: "userBio")
    UserDefaults.standard.setValue(indexPath.row, forKey: "selectedRow")
    UserDefaults.standard.setValue(indexPath.section, forKey: "selectedSection")
    
    var indexpathToReload: [IndexPath] = []
    if let previous = previousIndexPath {
      indexpathToReload.append(previous)
    }
    indexpathToReload.append(indexPath)
    
    
    tableView.reloadRows(at: indexpathToReload, with: .automatic)
  }
  
}
