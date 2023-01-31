//
//  ForgotPasswordRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 31.01.2023.
//

protocol ForgotPasswordRoute {
    func pushForgotPassword()
}

extension ForgotPasswordRoute where Self: RouterProtocol {
    
    func pushForgotPassword() {
        let router = ForgotPasswordRouter()
        let viewModel = ForgotPasswordViewModel(router: router)
        let viewController = ForgotPasswordViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
