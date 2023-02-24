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
    func editorChoicesRequestFetch(isRefreshing: Bool)
    func lastAddedRequestFetch()
}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {

    var page = 1
    var isPagingEnabled = false
    var title: String?
    var didSuccessFetchRecipes: VoidClosure?
    
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
    
    func editorChoicesRequestFetch(isRefreshing: Bool) {
        
        if isRefreshing == false {
            showLoading?()
        }
        let request = EditorChoicesRequest(page: page)
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            if isRefreshing == false {
                self.hideLoading?()
            }
            switch result {
            case .success(let response):
                let cellItems = response.data.map({ RecipeCellModel(recipe: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.pagination.lastPage > response.pagination.currentPage
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
            
        }
    }
    
    func lastAddedRequestFetch() {
        showLoading?()
        let request = LastAddedRequest(page: page)
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                let cellItems = response.data.map({ RecipeCellModel(recipe: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.pagination.lastPage > response.pagination.currentPage
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
