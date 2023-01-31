//
//  AppRouter.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 27.01.2023.
//

import MobilliumUserDefaults
 
final class AppRouter: Router, AppRouter.Routes {

    typealias Routes = WalkthroughRoute
    
    static let shared = AppRouter()
    
    func startApp() {
       placeOnWindowWalkthrough()
    }

    private func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
}
