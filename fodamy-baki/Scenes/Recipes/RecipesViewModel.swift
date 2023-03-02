//
//  RecipesViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 13.02.2023.
//

import DataProvider

protocol RecipesViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemAt(_ indexPath: IndexPath) -> RecipeCellProtocol
}

protocol RecipesViewEventSource {
    var didSuccessFetchRecipes: VoidClosure? { get }
}

protocol RecipesViewProtocol: RecipesViewDataSource, RecipesViewEventSource {
    func fetchRecipeListing(isRefreshing: Bool)
    func fetchMorePages(isPaging: Bool)
}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {
    
    enum RecipesListing {
        case editorChoices
        case lastAdded
        case categoryRecipes(categoryId: Int)
    }
    
    let recipesListing: RecipesListing
    var page = 1
    var categoryId: Int?
    var isPagingEnabled = false
    var title: String?
    var didSuccessFetchRecipes: VoidClosure?
    
    init(recipesListing: RecipesListing, router: RecipesRouter) {
        self.recipesListing = recipesListing
        super.init(router: router)
    }
    
    func numberOfItemsAt() -> Int {
        let cell = cellItems.count
        return cell
    }
    
    func cellItemAt(_ indexPath: IndexPath) -> RecipeCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func setDefaults() {
        cellItems.removeAll()
        page = 1
    }
    
    private var cellItems: [RecipeCellProtocol] = []
}

// MARK: - Network
extension RecipesViewModel {
    
    func fetchRecipeListing(isRefreshing: Bool) {
        var request: GetRecipesRequestRequest
        switch recipesListing {
        case .editorChoices:
            request = GetRecipesRequestRequest(page: page, listType: .editorChoiceRecipes)
        case .lastAdded:
            request = GetRecipesRequestRequest(page: page, listType: .lastAddedRecipes)
        case .categoryRecipes(let categoryId):
            request = GetRecipesRequestRequest(page: page, listType: .categoryRecipes(categoryId: categoryId))
    
        }

        if isRefreshing == false {
            showLoading?()
        }
        dataProvider.request(for: request ) { [weak self] result in
            guard let self = self else { return }
            if isRefreshing == false {
                self.hideLoading?()
            }
            switch result {
            case .success(let response):
                let cellItems = response.data.map({ RecipeCellModel(recipe: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.pagination.currentPage < response.pagination.lastPage
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func fetchMorePages(isPaging: Bool) {
        if isPaging == true {
            self.showActivityIndicatorBottomView?()
            fetchRecipeListing(isRefreshing: false)
            self.hideActivityIndicatorView?()
        }
    }
}
