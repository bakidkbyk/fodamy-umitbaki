//
//  PaddingLabel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 8.03.2023.
//

public class PaddingLabel: UILabel {
    
    var textEdgeInsets = UIEdgeInsets.zero {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    public var leftPadding: CGFloat {
        get {
            textEdgeInsets.left
        }
        set {
            textEdgeInsets.left = newValue
        }
    }
    
    public var rightPadding: CGFloat {
        get {
            textEdgeInsets.right
        }
        set {
            textEdgeInsets.right = newValue
        }
    }
    
    public var topPadding: CGFloat {
        get {
            textEdgeInsets.top
        }
        set {
            textEdgeInsets.top = newValue
        }
    }
    
    public var bottomPadding: CGFloat {
        get {
            textEdgeInsets.bottom
        }
        set {
            textEdgeInsets.bottom = newValue
        }
    }
    
    public override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textEdgeInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textEdgeInsets.top,
                                          left: -textEdgeInsets.left,
                                          bottom: -textEdgeInsets.bottom,
                                          right: -textEdgeInsets.right)
        return textRect.inset(by: invertedInsets)
    }
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textEdgeInsets))
    }
}
