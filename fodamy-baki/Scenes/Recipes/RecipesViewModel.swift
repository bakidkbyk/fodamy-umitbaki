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
    func fetchRecipeListing(isRefreshing: Bool, isPaging: Bool)
    func fetchMorePages()
    func didSelectRecipe(indexPath: IndexPath)
}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {

    enum RecipesListing {
        case editorChoices
        case lastAdded
        case categoryRecipes(categoryId: Int)
    }
    
    let recipesListing: RecipesListing
    var isRequestEnabled = false
    var isPagingEnabled = false
    var page = 1
    var categoryId: Int?
    var title: String?
    var didSuccessFetchRecipes: VoidClosure?
    var endRefreshing: VoidClosure?
    
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
    
    func fetchRecipeListing(isRefreshing: Bool, isPaging: Bool) {
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
            if page == 1 && isPaging == false {
                showLoading?()
            } else {
                showActivityIndicatorBottomView?()
            }
        }
        self.isRequestEnabled = false
        dataProvider.request(for: request ) { [weak self] result in
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
    
    func fetchMorePages() {
        fetchRecipeListing(isRefreshing: false, isPaging: true)
    }
}

// MARK: - Action
extension RecipesViewModel {
    
    func didSelectRecipe(indexPath: IndexPath) {
        let recipeId = cellItems[indexPath.row].recipeId
        router.pushRecipeDetails(recipeId: recipeId)
    }
}
