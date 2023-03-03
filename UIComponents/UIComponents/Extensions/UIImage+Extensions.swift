//
//  UIImage+Extensions.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 27.02.2023.
//

public extension UIImage {
    
    func resize(to size: CGSize, for contentMode: UIView.ContentMode? = nil) -> UIImage {
        switch contentMode {
        case .scaleAspectFit:
            return kf.resize(to: size, for: .aspectFit)
        case .scaleToFill:
            return kf.resize(to: size, for: .aspectFill)
        default:
            return kf.resize(to: size)
        }
    }
    
}

