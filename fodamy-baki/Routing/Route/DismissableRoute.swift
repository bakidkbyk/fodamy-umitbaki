//
//  DismissableRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 4.07.2023.
//

import Foundation

protocol DismissableRoute {
    func dismiss(isAnimated: Bool, completion: VoidClosure?)
}

extension DismissableRoute where Self: RouterProtocol {
    func dismiss(isAnimated: Bool = true, completion: VoidClosure? = nil) {
        guard let viewController = self.viewController else {
            assertionFailure("Nothing to close.")
            return
        }
        viewController.dismiss(animated: isAnimated, completion: completion)
    }
}
