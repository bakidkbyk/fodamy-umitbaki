//
//  HomeViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.01.2023.
//

protocol HomeViewDataSource {
    var selectedSegmentIndex: Int { get set }
}

protocol HomeViewEventsource {}

protocol HomeViewModelProtocol: HomeViewDataSource, HomeViewEventsource {}

class HomeViewModel: BaseViewModel<HomeViewRouter>, HomeViewModelProtocol {
    
    var selectedSegmentIndex = 0
}
