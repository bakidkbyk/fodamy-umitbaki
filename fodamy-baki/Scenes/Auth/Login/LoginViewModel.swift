//
//  LoginViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 27.01.2023.
//

import KeychainSwift

protocol LoginViewDataSource {}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
    func showRegisterScreen()
    func showForgotPasswordScreen()
    func sendLoginRequest(username: String, password: String)
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
   
    let keyChainSwift = KeychainSwift()
}

// MARK: - Actions
extension LoginViewModel {
    
     func showRegisterScreen() {
        router.pushRegister()
    }
    
    func showForgotPasswordScreen() {
        router.pushForgotPassword()
    }
}

// MARK: - Url
extension LoginViewModel {
    
    func sendLoginRequest(username: String, password: String) {
        showLoading?()
        dataProvider.request(for: LoginRequest(username: username, password: password)) { [ weak self ] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                self.keyChainSwift.set(response.token, forKey: Keychain.token)
                self.router.dismiss()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
