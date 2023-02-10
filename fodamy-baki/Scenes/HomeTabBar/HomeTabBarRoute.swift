//
//  HomeTabBarRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 7.02.2023.
//

protocol HomeTabBarRoute {
    func placeOnWindowTabBar()
}

extension HomeTabBarRoute where Self: RouterProtocol {
    
    func placeOnWindowTabBar() {
        let homeTabBarController = HomeTabBarViewController()
        let transition = PlaceOnWindowTransition()
        
        open(homeTabBarController, transition: transition)
    }
}
