//
//  CommentListViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 9.06.2023.
//

protocol CommentListViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemsAt(_ indexPath: IndexPath) -> CommentCellProtocol
}

protocol CommentListViewEventSource {
    var didSuccessListComments: VoidClosure? { get set }
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
    var endRefreshing: VoidClosure?
    var didSuccessListComments: VoidClosure?
    
    private var cellItems: [CommentCellProtocol] = []
    
    func numberOfItemsAt() -> Int {
        return cellItems.count
    }
    
    func cellItemsAt(_ indexPath: IndexPath) -> CommentCellProtocol {
        return cellItems[indexPath.row]
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
        dataProvider.request(for: GetRecipeCommentsRequest(recipeId: recipeId, page: page)) { [weak self] result in
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
    
    func fetchMorePages() {
        getRecipeCommentList(isRefreshing: false, isPaging: true)
    }
}
