//
//  HomeViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.01.2023.
//

protocol HomeViewDataSource { }

protocol HomeViewEventsource { }

protocol HomeViewModelProtocol: HomeViewDataSource, HomeViewEventsource {
    
    func showInitialViewOnWindow()
}

class HomeViewModel: BaseViewModel<HomeVCRouter>, HomeViewModelProtocol {
    
    func showInitialViewOnWindow() {
        
    }
}
