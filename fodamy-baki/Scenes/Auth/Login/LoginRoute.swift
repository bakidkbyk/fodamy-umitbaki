//
//  LoginRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 24.01.2023.
//

protocol LoginRoute {
    func presentLogin()
}

extension LoginRoute where Self: RouterProtocol {
    
    func presentLogin() {
        let router = LoginRouter()
        let viewModel = LoginViewModel(router: router)
        let viewController = LoginViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
