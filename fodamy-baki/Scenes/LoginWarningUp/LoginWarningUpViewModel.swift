//
//  LoginWarningUpViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 23.06.2023.
//

import Foundation
import KeychainSwift

protocol LoginWarningUpViewDataSource {}

protocol LoginWarningUpViewEventSource {}

protocol LoginWarningUpViewProtocol: LoginWarningUpViewDataSource, LoginWarningUpViewEventSource {
    func giveUpButtonAction()
    func loginButtonAction()
}

final class LoginWarningUpViewModel: BaseViewModel<LoginWarningUpRouter>, LoginWarningUpViewProtocol {
    
    let keychain = KeychainSwift()
    var loginButtonTapped: VoidClosure?
    
    func giveUpButtonAction() {
        router.close()
    }
    
    init(router: LoginWarningUpRouter, dataProvider: DataProviderProtocol = apiDataProvider, loginButtonTapped: VoidClosure?) {
        self.loginButtonTapped = loginButtonTapped
        super.init(router: router, dataProvider: dataProvider)
        
    }
    func loginButtonAction() {
        router.dismiss(isAnimated: false) { [weak self] in
            self?.loginButtonTapped?()
        }
    }
}
