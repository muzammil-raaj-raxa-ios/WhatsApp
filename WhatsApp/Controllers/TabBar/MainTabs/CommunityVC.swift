//
//  CommunityVC.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 03/09/2024.
//

import UIKit
import Lottie
import SafariServices

class CommunityVC: UIViewController {
  
  @IBOutlet weak var animationView: LottieAnimationView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      setupAnimationView()
    }
  
  @IBAction func exampleCommunityBtn(_ sender: Any) {
    let url = URL(string: "https://faq.whatsapp.com/231869526393268?locale=en_US")
    let vc = SFSafariViewController(url: url!)
    vc.modalPresentationStyle = .overFullScreen
    present(vc, animated: true)
    print("Example community Button pressed")
  }
  
  
  @IBAction func newCommunityBtn(_ sender: Any) {
    print("New community Button pressed")
  }
  
  func setupAnimationView() {
    animationView.contentMode = .scaleAspectFit
    animationView.loopMode = .loop
    animationView.animationSpeed = 1.0
    animationView.play()
  }
}
