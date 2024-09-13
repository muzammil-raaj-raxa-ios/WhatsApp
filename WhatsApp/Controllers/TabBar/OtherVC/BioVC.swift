//
//  BioVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 09/09/2024.
//

import UIKit

class BioVC: UIViewController, UIGestureRecognizerDelegate, NewlyAddedBioDelegate {
  
  @IBOutlet weak var bioTblViewHeight: NSLayoutConstraint!
  @IBOutlet weak var bioTableView: UITableView!
  @IBOutlet weak var currentBioLabel: UILabel!
  @IBOutlet weak var customBioBtn: UIButton!
  
  var selectedIndexPath: IndexPath?
  var newlyAddedBio: String?
  
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
    
    self.title = "Bio"
    navigationController?.navigationBar.prefersLargeTitles = false
    loadBiosFromUserDefaults()
    setupBioTableView()
    setupIndexPath()
    customBioBtn.setTitle("", for: .normal)
  }
  
  @IBAction func backBtn(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func customBioBtn(_ sender: Any) {
    let storyboard = UIStoryboard(name: "OtherVC", bundle: .main)
    if let vc = storyboard.instantiateViewController(withIdentifier: "CustomBioVC") as? CustomBioVC {
      vc.hidesBottomBarWhenPushed = true
      vc.modalPresentationStyle = .formSheet
      vc.delegate = self
      present(vc, animated: true)
    }
  }
  
  func setupBioTableView() {
    bioTableView.delegate = self
    bioTableView.dataSource = self
    bioTableView.register(UINib(nibName: "BioCell", bundle: .main), forCellReuseIdentifier: "BioCell")
    updateBioTblViewHeight()
  }
  
  func updateBioTblViewHeight() {
    let noOfRows = tableView(bioTableView, numberOfRowsInSection: bios.count)
    let height = CGFloat(noOfRows) * 50
    bioTblViewHeight.constant = height
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
  
  func newBio(_ bio: String) {
    print(bio)
    newlyAddedBio = bio
    currentBioLabel.text = bio
    UserDefaults.standard.setValue(bio, forKey: "userBio")
    
    let newBio = BiosModel(bioText: bio)
    bios.insert(newBio, at: 0)
    
    selectedIndexPath = IndexPath(row: 0, section: 0)
    savedBiosToUserDefault()
    
    UserDefaults.standard.setValue(0, forKey: "selectedRow")
    UserDefaults.standard.setValue(0, forKey: "selectedSection")
    
    
    bioTableView.reloadData()
  }
  
  func savedBiosToUserDefault() {
    let newBios = bios.map { $0.bioText }
    print(newBios)
    UserDefaults.standard.set(newBios, forKey: "savedBios")
  }
  
  func loadBiosFromUserDefaults() {
    if let savedBios = UserDefaults.standard.stringArray(forKey: "savedBios") {
      bios = savedBios.map { BiosModel(bioText: $0) }
    } else {
      bios = [
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
