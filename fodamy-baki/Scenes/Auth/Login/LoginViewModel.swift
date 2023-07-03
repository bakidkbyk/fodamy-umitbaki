//
//  LoginViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 27.01.2023.
//

import KeychainSwift

protocol LoginViewDataSource {}

protocol LoginViewEventSource {
    var pushHomeClosure: VoidClosure? { get }
}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
    func showRegisterScreen()
    func showForgotPasswordScreen()
    func showHomeScreen()
    func sendLoginRequest(username: String, password: String)
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    
    var pushHomeClosure: VoidClosure?
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
    
    func showHomeScreen() {
        router.placeOnWindowHome()
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
                self.pushHomeClosure?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
