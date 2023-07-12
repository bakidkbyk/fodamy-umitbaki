//
//  CommentListRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 9.06.2023.
//

protocol CommentListRoute {
    func pushCommentList(recipeId: Int)
}

extension CommentListRoute where Self: RouterProtocol {
    
    func pushCommentList(recipeId: Int) {
        let router = CommentListRouter()
        let viewModel = CommentListViewModel(recipeId: recipeId, router: router)
        let viewController = CommentListViewController(viewModel: viewModel)
        viewController.hidesBottomBarWhenPushed = true
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
