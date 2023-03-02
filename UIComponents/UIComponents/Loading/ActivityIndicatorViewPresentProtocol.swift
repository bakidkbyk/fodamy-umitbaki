//
//  ActivityIndicatorViewPresentProtocol.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 4.01.2023.
//

import Foundation

public protocol ActivityIndicatorProtocol {
    func showActivityIndicator(indicatorType: ShowingActivityIndicatorLocation)
    func hideActivityIndicator()

}

public extension ActivityIndicatorProtocol where Self: UIViewController {
    
    func showActivityIndicator(indicatorType: ShowingActivityIndicatorLocation) {
        let indicator = ActivityIndicatorView(frame: .infinite)
        indicator.startAnimating()
        view.addSubview(indicator)
        view.bringSubviewToFront(indicator)
        
        switch indicatorType {
        case .center:
            indicator.centerInSuperview(usingSafeArea: true)
        case .bottom:
            indicator.bottomToSuperview(usingSafeArea: true).constant = 4
            indicator.centerXToSuperview()
        }
        
    }
    
    func hideActivityIndicator() {
        view.subviews.filter({ $0 is ActivityIndicatorView }).forEach({ $0.removeFromSuperview() })
    }
}
