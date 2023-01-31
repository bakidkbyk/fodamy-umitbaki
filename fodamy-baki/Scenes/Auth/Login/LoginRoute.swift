//
//  LoginRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 27.01.2023.
//

protocol LoginRoute {
    func placeOnWindowLogin()
}

extension LoginRoute where Self: RouterProtocol {
    
    func placeOnWindowLogin() {
        let router = LoginRouter()
        let viewModel = LoginViewModel(router: router)
        let viewController = LoginViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
