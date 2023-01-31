//
//  LoginRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 27.01.2023.
//

protocol LoginRoute {
    func pushLogin()
}

extension LoginRoute where Self: RouterProtocol {
    
    func pushLogin() {
        let router = LoginRouter()
        let viewModel = LoginViewModel(router: router)
        let viewController = LoginViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
