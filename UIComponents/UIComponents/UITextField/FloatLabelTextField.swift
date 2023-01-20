//
//  FloatLabelTextField.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 19.01.2023.
//

import UIKit
import MobilliumBuilders

public class FloatLabelTextField: UITextField {
    
    private let titleLabel = UILabelBuilder()
        .textColor(.appZircon)
        .font(.font(.nunitoSemiBold, size: .large))
        .build()
    
    private let imageView = UIImageViewBuilder()
        .tintColor(.appCinder)
        .contentMode(.scaleAspectFit)
        .build()
    
    private let insets = UIEdgeInsets(top: 29, left: 15, bottom: 12, right: 15)
    
    public var title: String? {
        willSet {
            placeholder = nil
            attributedPlaceholder = nil
            titleLabel.text = newValue
            titleLabel.sizeToFit()
        }
    }
    
    public var leftImage: UIImage? {
        willSet {
            if let image = newValue {
                imageView.image = image.withRenderingMode(.alwaysTemplate)
                leftView = imageView
                leftViewMode = .always
            } else {
                imageView.image = nil
                leftView = nil
                leftViewMode = .never
            }
        }
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: insets)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: insets)
    }
    
    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x = 15
        rect.origin.y = 21
        return rect
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
}

// MARK: - ConfigureContents - SetTitle
extension FloatLabelTextField {
    
    private func configureContents() {
        
    }
    
}
