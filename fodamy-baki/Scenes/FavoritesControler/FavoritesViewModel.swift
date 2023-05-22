//
//  FavoritesViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 7.02.2023.
//
import KeychainSwift

protocol FavoritesViewDataSource {
    
    func numberOfItemsAt() -> Int
    func cellItemAt(_ indexPath: IndexPath) -> FavoritesCellProtocol
}

protocol FavoritesViewEventSource {
    
    var didSuccessFetchRecipes: VoidClosure? { get set }
    var endRefreshing: VoidClosure? { get set }
    var didSuccessLogout: VoidClosure? { get set }
}

protocol FavoritesViewProtocol: FavoritesViewDataSource, FavoritesViewEventSource {
    
    func seeAllButtonTapped(categoryId: Int, title: String)
    func didSelectRecipe(recipeId: Int)
    func fetchCategoryRecipes(isRefreshing: Bool, isPaging: Bool)
    func fetchMorePages()
    func userLogout()
}

final class FavoritesViewModel: BaseViewModel<FavoritesRouter>, FavoritesViewProtocol {
   
    var endRefreshing: VoidClosure?
    var didSuccessFetchRecipes: VoidClosure?
    var didSuccessLogout: VoidClosure?
   
    let keychain = KeychainSwift()
    
    var isRequestEnabled = false
    var isPagingEnabled = false
    var page = 1

    func numberOfItemsAt() -> Int {
        let cell = cellItems.count
        return cell
    }
    
    func cellItemAt(_ indexPath: IndexPath) -> FavoritesCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func setDefaults() {
        cellItems.removeAll()
        
        page = 1
    }

    private var cellItems: [FavoritesCellModel] = []
    
}

// MARK: - Actions
extension FavoritesViewModel {
    
    func seeAllButtonTapped(categoryId: Int, title: String) {
        router.pushRecipes(categoryId: categoryId, title: title)
    }
    
    func didSelectRecipe(recipeId: Int) {
        router.pushRecipeDetails(recipeId: recipeId)
    }
    func fetchMorePages() {
        fetchCategoryRecipes(isRefreshing: false, isPaging: true)
    }
}

// MARK: - Network
extension FavoritesViewModel {
    
    func fetchCategoryRecipes(isRefreshing: Bool, isPaging: Bool) {
        let request = GetCategoryRecipesRequest(page: page)
        
        if isRefreshing == false {
            if page == 1 && isPaging == false {
                showLoading?()
            } else {
                showActivityIndicatorBottomView?()
            }
        }
        
        self.isRequestEnabled = false
        dataProvider.request(for: request) { [ weak self ] result in
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
                let cellItems = response.data.map({ FavoritesCellModel(categoryRecipes: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.pagination.currentPage < response.pagination.lastPage
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func userLogout() {
        let logoutRequest = LogoutRequest()
        showLoading?()
        dataProvider.request(for: logoutRequest) { [weak self ] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success:
                self.didSuccessLogout?()
                self.keychain.delete(Keychain.token)
            case.failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
