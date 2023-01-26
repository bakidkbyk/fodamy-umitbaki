//
//  ButtonFactory.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 16.01.2023.
//

public class ButtonFactory {
    
    public enum Style {
        case small
        case medium
        case large
        
        var height: CGFloat {
            switch self {
            case .small:
                return 40
            case .medium:
                return 50
            case .large:
                return 60
            }
        }
        
        var fontSize: UIFont.FontSize {
            switch self {
            case .small:  return .xSmall
            case .medium: return . medium
            case .large:  return .xLarge
            }
        }
    }
    
    public static func createPrimaryButton(style: Style) -> UIButton {
        let button = UIButtonBuilder()
            .titleFont(.font(.nunitoBold, size: style.fontSize))
            .titleColor(.appWhite)
            .backgroundColor(.appRed)
            .cornerRadius(4)
            .build()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: style.height).isActive = true
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        return button
    }
    
    public static func createPrimaryBorderedButton(style: Style) -> UIButton {
        
        let button = UIButtonBuilder()
            .titleFont(.font(.nunitoBold, size: style.fontSize))
            .titleColor(.appRed)
            .backgroundColor(.appWhite)
            .cornerRadius(4)
            .borderWidth(2)
            .borderColor(UIColor.appRed.cgColor)
            .build()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: style.height).isActive = true
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        return button
        
    }
}
