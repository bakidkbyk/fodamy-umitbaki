//
//  LoginViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 24.01.2023.
//

import Foundation

protocol LoginViewDataSource {}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    
}
