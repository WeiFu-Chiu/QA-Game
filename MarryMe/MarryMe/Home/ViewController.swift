//
//  ViewController.swift
//  MarryMe
//
//  Created by LC105-21417-02 on 2023/4/11.
//

import UIKit
import Lottie

class ViewController: BaseViewController {
    @IBOutlet weak var logoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnimationView(jsonName: "text-icon", specificView: logoView, speed: 0.7, loopMode: .loop, orignPosition: (x: 0, y: 0), frameTime: (from: 0, to: 60), completion: { success, animationView in
            if success {
                
            }
        })
    }

    
    @IBAction func startedAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Content", bundle: nil)
        if let nvc = storyboard.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController {
            nvc.modalPresentationStyle = .fullScreen
            nvc.modalTransitionStyle = .crossDissolve
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            self.navigationController?.pushViewController(nvc, animated: true)
        }
    }
}

