//
//  HomeVCRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.01.2023.
//

protocol HomeVCRoute {
    func presentHomeVC()
}

extension HomeVCRoute where Self: RouterProtocol {
    
    func presentHomeVC() {
        let router = HomeVCRouter()
        let viewModel = HomeViewModel(router: router)
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        let transition = PlaceOnWindowTransition()
        
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
