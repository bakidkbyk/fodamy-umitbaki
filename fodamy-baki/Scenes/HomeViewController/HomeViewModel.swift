//
//  HomeViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.01.2023.
//

import AVFoundation

protocol HomeViewDataSource {
    var selectedSegmentIndex: Int { get set }
}

protocol HomeViewEventsource {
    var didSuccessLogut: VoidClosure? { get set }
}

protocol HomeViewModelProtocol: HomeViewDataSource, HomeViewEventsource {
    func userLogout()
}

class HomeViewModel: BaseViewModel<HomeViewRouter>, HomeViewModelProtocol {
    
    var selectedSegmentIndex = 0
    var didSuccessLogut: VoidClosure?
}

// MARK: Network
extension HomeViewModel {
    
    func userLogout() {
        showLoading?()
        let request = LogoutRequest()
        dataProvider.request(for: request) { [ weak self ] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success:
                self.didSuccessLogut?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
