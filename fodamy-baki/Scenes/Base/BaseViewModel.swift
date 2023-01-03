//
//  BaseViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.01.2023.
//

protocol BaseViewModelDataSource { }

protocol BaseViewModelEventSource { }

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    let router: R
    
    init(router: R) {
        self.router = router
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
