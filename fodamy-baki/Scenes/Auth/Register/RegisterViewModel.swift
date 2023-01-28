//
//  RegisterViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 24.01.2023.
//

import Foundation

protocol RegisterViewDataSource {}
protocol RegisterViewEventSource {}
protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {
    func showLoginScreen()
    func sendRegisterRequest(username: String, email: String, password: String)
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {}

// MARK: - Actions
extension RegisterViewModel {
    
    func showLoginScreen() {
        router.pushLogin()
    }
}

// MARK: - Network
extension RegisterViewModel {
    
    func sendRegisterRequest(username: String, email: String, password: String) {
        showLoading?()
        dataProvider.request(for: RegisterRequest(username: username, email: email, password: password)) { [ weak self ] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success:
                self.showLoginScreen()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
