//
//  HomeTabBarRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 7.02.2023.
//

protocol HomeTabBarRoute {
    func pushHomeTabBar()
}

extension HomeTabBarRoute where Self: RouterProtocol {
    
    func pushHomeTabBar() {
        let router = HomeTabBarRouter()
        let viewModel = HomeTabBarViewModel(router: router)
        let viewController = HomeTabBarViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
