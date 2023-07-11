//
//  LoginWarningUpRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 23.06.2023.
//

protocol LoginWarningUpRoute {
    func presentLoginWarningUp(loginButtonTapped: VoidClosure?)
}

extension LoginWarningUpRoute where Self: RouterProtocol {
    
    func presentLoginWarningUp(loginButtonTapped: VoidClosure?) {
        let router = LoginWarningUpRouter()
        let viewModel = LoginWarningUpViewModel(router: router, loginButtonTapped: loginButtonTapped)
        let viewController = LoginWarningUpViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        transition.modalPresentationStyle = .overFullScreen
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
