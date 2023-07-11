//
//  CommentEditRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 8.07.2023.
//

protocol CommentEditRoute {
    func pushCommentEdit()
}

extension CommentEditRoute where Self: RouterProtocol {
    
    func pushCommentEdit() {
        let router = CommentEditRouter()
        let viewModel = CommentEditViewModel(router: router)
        let viewController = CommentEditViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
