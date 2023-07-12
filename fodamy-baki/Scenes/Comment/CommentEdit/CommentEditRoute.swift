//
//  CommentEditRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 8.07.2023.
//

protocol CommentEditRoute {
    func pushCommentEdit(recipeId: Int, commentId: Int, commentText: String?, commentEditDidSuccess: StringClosure?)
}

extension CommentEditRoute where Self: RouterProtocol {
    
    func pushCommentEdit(recipeId: Int, commentId: Int, commentText: String?, commentEditDidSuccess: StringClosure?) {
        let router = CommentEditRouter()
        let viewModel = CommentEditViewModel(recipeId: recipeId, commentId: commentId, commentText: commentText, router: router)
        let viewController = CommentEditViewController(viewModel: viewModel)
        viewModel.commentEditDidSuccess = commentEditDidSuccess
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
