//
//  BaseViewController.swift
//  MarryMe
//
//  Created by LC105-21417-02 on 2023/4/13.
//

import Foundation
import UIKit
import Lottie


class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        tapGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
        
        let scene = UIApplication.shared.connectedScenes
        guard let windowScene = scene.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        
        window.endEditing(true)
    }
    
    @objc func tapGesture() {
        /// Hide DropDown PickerView
        let scene = UIApplication.shared.connectedScenes
        guard let windowScene = scene.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        
        window.endEditing(true)
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func addAnimationView(jsonName name: String, specificView: UIView, speed: CGFloat, orignPosition: (x: CGFloat,y: CGFloat), frameTime: (from: CGFloat, to: CGFloat), completion: @escaping (Bool, LottieAnimationView) -> ()) {
        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(name)
        animationView.animation = animation
        animationView.frame = specificView.frame
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.animationSpeed = speed
        animationView.backgroundBehavior = .pauseAndRestore
        specificView.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: specificView.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: specificView.widthAnchor),
            animationView.topAnchor.constraint(equalTo: specificView.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: specificView.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: specificView.trailingAnchor),
            animationView.bottomAnchor.constraint(equalTo: specificView.bottomAnchor)
        ])
        animationView.play(fromFrame: frameTime.from, toFrame: frameTime.to, loopMode: .loop, completion: { finished in
            if finished {
                completion(finished, animationView)
            }
        })
    }
        
    func addAnimationButton(jsonName name: String, animationButton: AnimatedButton, specificView: UIView, speed: CGFloat, orignPosition: (x: CGFloat,y: CGFloat), frameTime: (from: CGFloat, to: CGFloat), completion: @escaping (Bool, AnimatedButton) -> ()) {
        let animation = LottieAnimation.named("warningAnimation")
        animationButton.animationView.animation = animation
        animationButton.animationView.loopMode = .loop
        animationButton.animationView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        animationButton.animationView.animationSpeed = 0.5
        animationButton.animationView.backgroundBehavior = .pauseAndRestore
        animationButton.animationView.play()
    
        animationButton.contentMode = .scaleAspectFit
        animationButton.translatesAutoresizingMaskIntoConstraints = false
        specificView.addSubview(animationButton)
        animationButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        animationButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        animationButton.topAnchor.constraint(equalTo: specificView.topAnchor, constant: -5).isActive = true
        animationButton.leadingAnchor.constraint(equalTo: specificView.leadingAnchor, constant: -5).isActive = true
        completion(true, animationButton)
//        animationButton.addTarget(self, action: #selector(showErrorMessage), for: .touchUpInside)
//        animationButton.isHidden = true
    }
}
