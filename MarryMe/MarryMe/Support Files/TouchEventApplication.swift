//
//  TouchEventApplication.swift
//  MarryMe
//
//  Created by 邱緯輔 on 2023/4/26.
//

import Foundation
import UIKit

class TouchEventApplication: UIApplication {
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        
        if let touches = event.allTouches {
            for touch in touches where touch.phase == UITouch.Phase.began {
//                UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
//
//                let scene = UIApplication.shared.connectedScenes
//                guard let windowScene = scene.first as? UIWindowScene,
//                      let window = windowScene.windows.first else {
//                    return
//                }
//
//                window.endEditing(true)
            }
        }
    }
}
