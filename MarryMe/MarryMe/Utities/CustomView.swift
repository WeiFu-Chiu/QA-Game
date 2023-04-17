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
    
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0,y: 0) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0,y: 0) {
        didSet {
            updateView()
        }
    }
    
    /// 陰影水平偏移量
    @IBInspectable var shadowOffsetWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    /// 陰影垂直偏移量
    @IBInspectable var shadowOffsetHeight: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    /// 陰影不透明度
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            updateView()
        }
    }
    
    /// 陰影圓角 (模糊度)
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    /// 陰影顏色
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            updateView()
        }
    }
    
    /// 邊框圓角角度
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    /// 框線寬度
    @IBInspectable var borderWith: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    /// 框線顏色
    @IBInspectable var borderColor: UIColor = UIColor.black {
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
        if startColor != .clear || endColor != .clear {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.bounds
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint
            self.layer.addSublayer(gradientLayer)
        }
        
        if cornerRadius != 0 {
            self.layer.cornerRadius = cornerRadius
        }
        
        if borderWith != 0 {
            self.layer.borderWidth = borderWith
            self.layer.borderColor = borderColor.cgColor
        }
        
//        self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
//        self.layer.shadowOpacity = shadowOpacity
//        self.layer.shadowRadius = shadowRadius
//        self.layer.shadowColor = shadowColor.cgColor
    }
}
