//
//  IconTextField.swift
//  EsunWealthExpressiOS
//
//  Created by LC105-21417-02 on 2022/4/27.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    // MARK: 整個輸入框的總體設定
    /// 左邊圖片
    @IBInspectable var leftImage: UIImage? = nil {
        didSet {
            setImage()
        }
    }
    
    /// 右邊圖片
    @IBInspectable public var rightImage: UIImage? = nil {
        didSet {
            setImage()
        }
    }
    
    /// 與左側邊界的水平偏移量
    @IBInspectable var offsetX: CGFloat = 0 {
        didSet {
            setImage()
        }
    }
    
    /// 與上方邊界的垂直偏移量
    @IBInspectable var offsetY: CGFloat = 0 {
        didSet {
            setImage()
        }
    }
    
    /// 左邊圖片的寬度
    @IBInspectable var leftImageWidth: CGFloat = 0 {
        didSet {
            setImage()
        }
    }
    
    /// 左邊圖片的高度
    @IBInspectable var leftImageHeight: CGFloat = 0 {
        didSet {
            setImage()
        }
    }
    
    /// 設定圖片顏色
    @IBInspectable var imageColor: UIColor = UIColor.black {
        didSet {
            setImage()
        }
    }
    
    /// 設定輸入框的圓角
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setImage()
        }
    }
    
    
    // MARK: 輸入框內文字的Padding
    var padding = UIEdgeInsets.zero
    
    /// 輸入框內文字與上方邊界的間距
    @IBInspectable public var topInset: CGFloat {
        get {
            return padding.top
        }
        set {
            padding.top = newValue
        }
    }
    
    /// 輸入框內文字與下方邊界的間距
    @IBInspectable public var bottomInset: CGFloat {
        get {
            return padding.bottom
        }
        set {
            padding.bottom = newValue
        }
    }

    /// 輸入框內文字與左方邊界的間距
    @IBInspectable public var leftInset: CGFloat {
        get {
            return padding.left
        }
        set {
            padding.left = newValue
        }
    }
    
    /// 輸入框內文字與右方邊界的間距
    @IBInspectable public var rightInset: CGFloat {
        get {
            return padding.right
        }
        set {
            padding.right = newValue
        }
    }
    
    /// 邊寬寬度
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    /// 邊寬顏色
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// 左邊圖片放置文字
    @IBInspectable var leftImageString: String = "" {
        didSet {
            setImage()
        }
    }
    
    // MARK: 客製化線條、背景
    /// 是否為 Alert 狀態
    var isAlert: Bool = false {
        didSet {
            updateView()
        }
    }
    
    /// 依元件狀態顯示背景色
    @IBInspectable var useStateCustomBackground: Bool = false
    
    // MARK: Normal State
    /// Enable background color
    @IBInspectable var normalBackgroundColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Enable 邊寬寬度
    @IBInspectable var normalBorderWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    /// Enable 邊寬顏色
    @IBInspectable var normalBorderColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Enable 左邊圖片顏色
    @IBInspectable var normalLeftImageColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Disable Input 文字顏色
    @IBInspectable var normalInputTextColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    // MARK: Disable State
    /// Disable background color
    @IBInspectable var disableBackgroundColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Disable 邊寬寬度
    @IBInspectable var disableBorderWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    /// Disable 邊寬顏色
    @IBInspectable var disableBorderColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Disable 左邊圖片顏色
    @IBInspectable var disableLeftImageColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Disable Input 文字顏色
    @IBInspectable var disableInputTextColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    // MARK: Highlight State
    /// Highlight background color
    @IBInspectable var highlightBackgroundColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Highlight 邊寬寬度
    @IBInspectable var highlightBorderWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    /// Highlight 邊寬顏色
    @IBInspectable var highlightBorderColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Highlight 左邊圖片顏色
    @IBInspectable var highlightLeftImageColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Highlight Input 文字顏色
    @IBInspectable var highlightInputTextColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    // MARK: Alert State
    /// Alert background color
    @IBInspectable var alertBackgroundColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Alert 邊寬寬度
    @IBInspectable var alertBorderWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    /// Alert 邊寬顏色
    @IBInspectable var alertBorderColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Alert 左邊圖片顏色
    @IBInspectable var alertLeftImageColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    /// Alert Input 文字顏色
    @IBInspectable var alertInputTextColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    // MARK: Set Padding
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: offsetX, y: offsetY, width: leftImageWidth, height: leftImageHeight)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // MARK: Auto Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
}

extension CustomTextField {
    /// 設定圖片
    private func setImage() {
        if !(leftImageString.isEmpty) {
            let stringLabel = UILabel()
            
            stringLabel.font = UIFont(name: "PingFangTC-Regular", size: 18)
            stringLabel.textColor = imageColor
            stringLabel.text = leftImageString
            
            leftViewMode = .always
            leftView = stringLabel
        } else if let leftImage = leftImage {
            // 更新左側圖片
            let imageView = UIImageView(image: leftImage)
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = imageColor
            leftView = imageView
            leftViewMode = .always
            // 更新TextField
            borderStyle = .none
       } else {
           leftView = nil
           leftViewMode = .never
       }
        
        if let rightImage = rightImage {
            // 更新右側側圖片
            let imageView = UIImageView(image: rightImage)
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = imageColor
            rightView = imageView
            rightViewMode = .always
            // 更新TextField
            borderStyle = .none
        } else {
            rightView = nil
            rightViewMode = .never
        }
    }
    
    /// 設定視圖
    private func updateView() {
        self.layer.cornerRadius = cornerRadius
        
        /// 依狀態判斷背景色
        if useStateCustomBackground {
            if isAlert {
                self.backgroundColor = alertBackgroundColor
                self.layer.borderWidth = alertBorderWidth
                self.layer.borderColor = alertBorderColor.cgColor
                self.textColor = alertInputTextColor
                if leftImage != nil || !(leftImageString.isEmpty) {
                    self.leftView?.tintColor = alertLeftImageColor
                    (self.leftView as? UILabel)?.textColor = alertLeftImageColor
               }
            } else if isEnabled {
                if isHighlighted || isEditing {
                    self.backgroundColor = highlightBackgroundColor
                    self.layer.borderWidth = highlightBorderWidth
                    self.layer.borderColor = highlightBorderColor.cgColor
                    self.textColor = highlightInputTextColor
                    if leftImage != nil || !(leftImageString.isEmpty) {
                        self.leftView?.tintColor = highlightLeftImageColor
                        (self.leftView as? UILabel)?.textColor = highlightLeftImageColor
                   }
                } else {
                    self.backgroundColor = normalBackgroundColor
                    self.layer.borderWidth = normalBorderWidth
                    self.layer.borderColor = normalBorderColor.cgColor
                    self.textColor = normalInputTextColor
                    if leftImage != nil || !(leftImageString.isEmpty) {
                        self.leftView?.tintColor = normalLeftImageColor
                        (self.leftView as? UILabel)?.textColor = normalLeftImageColor
                   }
                }
            } else  {
                self.backgroundColor = disableBackgroundColor
                self.layer.borderWidth = disableBorderWidth
                self.layer.borderColor = disableBorderColor.cgColor
                self.textColor = disableInputTextColor
                if leftImage != nil || !(leftImageString.isEmpty) {
                    self.leftView?.tintColor = disableLeftImageColor
                    (self.leftView as? UILabel)?.textColor = disableLeftImageColor
               }
            }
        } else {
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
