//
//  CommentEditViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 8.07.2023.
//

import Foundation
import UIComponents

protocol CommentEditViewDataSource {
    var commentText: String? { get }
    var title: String { get }
}

protocol CommentEditViewEventSource {
    var commentEditDidSuccess: StringClosure? { get }
}

protocol CommentEditViewProtocol: CommentEditViewDataSource, CommentEditViewEventSource {
    func commentEdit(commentText: String)
}

final class CommentEditViewModel: BaseViewModel<CommentEditRouter>, CommentEditViewProtocol {
    
    var title = L10n.CommentEdit.title
    var commentText: String?
    private let recipeId: Int
    private let commentId: Int
    var commentEditDidSuccess: StringClosure?
    
    init(recipeId: Int, commentId: Int, commentText: String?, router: CommentEditRouter) {
        self.recipeId = recipeId
        self.commentId = commentId
        self.commentText = commentText
        super.init(router: router)
    }
}

// MARK: URL
extension CommentEditViewModel {
    
    func commentEdit(commentText: String) {
        showLoading?()
        let request = CommentEditRequest(recipeId: recipeId, commentId: commentId, commentText: commentText)
        dataProvider.request(for: request, result: { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success:
                self.commentEditDidSuccess?(commentText)
                self.router.close()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        })
    }
}
