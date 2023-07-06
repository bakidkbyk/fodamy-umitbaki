//
//  CommentListViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 9.06.2023.
//

import Utilities
import KeychainSwift

protocol CommentListViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemsAt(_ indexPath: IndexPath) -> CommentCellProtocol
}

protocol CommentListViewEventSource {
    var didSuccessListComments: VoidClosure? { get set }
    var postCommentDidSuccess: VoidClosure? { get set }
}

protocol CommentListViewProtocol: CommentListViewDataSource, CommentListViewEventSource {
    func getRecipeCommentList(isRefreshing: Bool, isPaging: Bool)
    func fetchMorePages()
}

final class CommentListViewModel: BaseViewModel<CommentListRouter>, CommentListViewProtocol {
    
    var recipeId: Int
    var page = 1
    var isRequestEnabled = false
    var isPagingEnabled = false
    var keychain = KeychainSwift()
    
    var endRefreshing: VoidClosure?
    var didSuccessListComments: VoidClosure?
    var postCommentDidSuccess: VoidClosure?
    
    private var cellItems: [CommentCellProtocol] = []
    
    func numberOfItemsAt() -> Int {
        return cellItems.count
    }
    
    func cellItemsAt(_ indexPath: IndexPath) -> CommentCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func refreshData() {
        page = 1
        getRecipeCommentList(isRefreshing: false, isPaging: false)
    }

    init(recipeId: Int, router: CommentListRouter) {
        self.recipeId = recipeId
        super.init(router: router)
    }
}

// MARK: - Network
extension CommentListViewModel {
    
    func getRecipeCommentList(isRefreshing: Bool, isPaging: Bool) {
        if isRefreshing == false {
            if page == 1 && isPaging == false {
                showLoading?()
            } else {
                showActivityIndicatorBottomView?()
            }
        }
        self.isRequestEnabled = false
        let request = GetRecipeCommentsRequest(recipeId: recipeId, page: page)
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            if !isRefreshing {
                self.hideLoading?()
                self.hideActivityIndicatorView?()
            } else {
                self.endRefreshing?()
            }
            self.isRequestEnabled = true
            switch result {
            case .success(let response):
                let cellItems = response.data.map({ CommentCellModel(comment: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.pagination.currentPage < response.pagination.lastPage
                self.didSuccessListComments?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func postRecipeComment(commentText: String) {
        showLoading?()
        let request = PostRecipeCommentRequest(recipeId: recipeId, commentText: commentText)
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success:
                self.cellItems.removeAll()
                self.page = 1
                self.getRecipeCommentList(isRefreshing: false, isPaging: false)
                self.postCommentDidSuccess?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func fetchMorePages() {
        getRecipeCommentList(isRefreshing: false, isPaging: true)
    }
}

// MARK: - Actions
extension CommentListViewModel {
    
    func sendButtonTapped(commentText: String) {
        guard keychain.get(Keychain.token) != nil else {
            router.presentLogin()
            return
        }
        postRecipeComment(commentText: commentText)
    }
}
