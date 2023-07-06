//
//  BaseViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.01.2023.
//

protocol BaseViewModelDataSource: AnyObject {}

protocol BaseViewModelEventSource: AnyObject {
    var showActivityIndicatorView: VoidClosure? { get set }
    var showActivityIndicatorBottomView: VoidClosure? { get set }
    var hideActivityIndicatorView: VoidClosure? { get set }
    
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
    
    var showTryAgainButton: VoidClosure? { get set }
    var hideTryAgainButton: VoidClosure? { get set }
    
    var showWarningToast: StringClosure? { get set }
}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func tryAgainButtonTapped()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    func tryAgainButtonTapped() {}
    
    var showActivityIndicatorView: VoidClosure?
    var showActivityIndicatorBottomView: VoidClosure?
    var hideActivityIndicatorView: VoidClosure?
    
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
    
    var showTryAgainButton: VoidClosure?
    var hideTryAgainButton: VoidClosure?
    
    var showWarningToast: StringClosure?
    
    let router: R
    let dataProvider: DataProviderProtocol
   
    init(router: R, dataProvider: DataProviderProtocol = apiDataProvider) {
        self.router = router
        self.dataProvider = dataProvider
       }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
