//
//  LoginWarningUpViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 23.06.2023.
//

import Foundation

protocol LoginWarningUpViewDataSource {}

protocol LoginWarningUpViewEventSource {}

protocol LoginWarningUpViewProtocol: LoginWarningUpViewDataSource, LoginWarningUpViewEventSource {
    func giveUpButtonAction()
    func loginButtonAction()
}

final class LoginWarningUpViewModel: BaseViewModel<LoginWarningUpRouter>, LoginWarningUpViewProtocol {
    
    func giveUpButtonAction() {
        router.close()
    }
    
    func loginButtonAction() {
        router.placeOnWindowLogin()
    }
}
