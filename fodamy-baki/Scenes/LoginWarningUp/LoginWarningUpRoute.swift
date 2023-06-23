//
//  LoginWarningUpRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 23.06.2023.
//

protocol LoginWarningUpRoute {
    func presentLoginWarningUp()
}

extension LoginWarningUpRoute where Self: RouterProtocol {
    
    func presentLoginWarningUp() {
        let router = LoginWarningUpRouter()
        let viewModel = LoginWarningUpViewModel(router: router)
        let viewController = LoginWarningUpViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
