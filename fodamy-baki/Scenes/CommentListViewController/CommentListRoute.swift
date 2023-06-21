//
//  CommentListRoute.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 9.06.2023.
//

protocol CommentListRoute {
    func pushCommentList()
}

extension CommentListRoute where Self: RouterProtocol {
    
    func pushCommentList() {
        let router = CommentListRouter()
        let viewModel = CommentListViewModel(router: router)
        let viewController = CommentListViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
