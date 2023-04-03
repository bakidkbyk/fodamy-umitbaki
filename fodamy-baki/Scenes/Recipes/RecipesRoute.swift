//
//  RecipesRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 7.03.2023.
//

protocol RecipesRoute {
    func pushRecipes(categoryId: Int, title: String)
}

extension RecipesRoute where Self: RouterProtocol {
    
    func pushRecipes(categoryId: Int, title: String) {
        let router = RecipesRouter()
        let viewModel = RecipesViewModel(recipesListing: .categoryRecipes(categoryId: categoryId), router: router)
        viewModel.title = title
        let viewController = RecipesViewController(viewModel: viewModel)
        viewController.hidesBottomBarWhenPushed = true

        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
