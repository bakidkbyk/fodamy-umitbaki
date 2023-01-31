//
//  RegisterRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 24.01.2023.
//

protocol RegisterRoute {
    func pushRegister()
}

extension RegisterRoute where Self: RouterProtocol {
    
    func pushRegister() {
        
        let router = RegisterRouter()
        let viewModel = RegisterViewModel(router: router)
        let viewController = RegisterViewController(viewModel: viewModel)
       
        let transition = PushTransition()
        
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
        
    }
}
