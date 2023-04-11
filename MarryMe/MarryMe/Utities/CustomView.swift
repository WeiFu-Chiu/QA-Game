//
//  CustomView.swift
//  MarryMe
//
//  Created by LC105-21417-02 on 2023/4/11.
//

import Foundation
import UIKit

class CustomView: UIView {
    @IBInspectable var startColor: UIColor = .clear
    @IBInspectable var endColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        self.layer.addSublayer(gradientLayer)
    }
}
