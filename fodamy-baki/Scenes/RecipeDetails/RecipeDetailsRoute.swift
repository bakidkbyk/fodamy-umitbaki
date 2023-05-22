//
//  RecipeDetailsRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

protocol RecipeDetailsRoute {
    func pushRecipeDetails(recipeId: Int)
}

extension RecipeDetailsRoute where Self: RouterProtocol {
    
    func pushRecipeDetails(recipeId: Int) {
        let router = RecipeDetailsRouter()
        let viewModel = RecipeDetailsViewModel(recipeId: recipeId, router: router)
        let viewController = RecipeDetailsViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
