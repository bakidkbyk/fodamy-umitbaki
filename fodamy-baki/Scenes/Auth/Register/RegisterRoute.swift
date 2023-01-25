//
//  RegisterRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 24.01.2023.
//

protocol RegisterRoute {
    func placeOnWindowRegister()
}

extension RegisterRoute where Self: RouterProtocol {
    
    func placeOnWindowRegister() {
        
        let router = RegisterRouter()
        let viewModel = RegisterViewModel(router: router)
        let viewController = RegisterViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        let transition = PlaceOnWindowTransition()
        
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
        
    }
}
