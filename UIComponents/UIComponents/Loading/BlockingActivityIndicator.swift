//
//  BlockingActivityIndicator.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 4.01.2023.
//

import UIKit

final class BlockingActivityIndicator: UIView {
    
    private let activityIndicator: UIActivityIndicatorView
    
    override init(frame: CGRect) {
        self.activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.tintColor = .black
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        super.init(frame: frame)
        backgroundColor = UIColor.gray.withAlphaComponent(0.35)
        addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
}

extension UIWindow {
    
    func startBlockingActivityIndicator() {
        guard !subviews.contains(where: { $0 is BlockingActivityIndicator }) else {
            return
        }
        
        let activityIndicator = BlockingActivityIndicator()
        activityIndicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        activityIndicator.frame = bounds
        
        UIView.transition(
            with: self,
            duration: 0.25,
            options: .transitionCrossDissolve,
            animations: {
                self.addSubview(activityIndicator)
            }
        )
    }
    
    func stopBlockingActivityIndicator() {
        subviews.filter({ $0 is BlockingActivityIndicator }).forEach({ $0.removeFromSuperview() })
    }
}
