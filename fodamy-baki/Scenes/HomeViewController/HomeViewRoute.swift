//
//  HomeVCRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.01.2023.
//

protocol HomeViewRoute {
    func presentHomeView()
}

extension HomeViewRoute where Self: RouterProtocol {
    
    func presentHomeView() {
        let router = HomeViewRouter()
        let viewModel = HomeViewModel(router: router)
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        let transition = PlaceOnWindowTransition()
        
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
