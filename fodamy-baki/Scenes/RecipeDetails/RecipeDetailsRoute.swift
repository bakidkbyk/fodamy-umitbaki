//
//  RecipeDetailsRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

protocol RecipeDetailsRoute {
    func pushRecipeDetails()
}

extension RecipeDetailsRoute where Self: RouterProtocol {
    
    func pushRecipeDetails() {
        let router = RecipeDetailsRouter()
        let viewModel = RecipeDetailsViewModel(router: router)
        let viewController = RecipeDetailsViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
