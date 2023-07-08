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
    
    func giveUpButtonAction() {
        router.close()
    }
    
    func loginButtonAction() {
        router.presentLogin()
    }
}
