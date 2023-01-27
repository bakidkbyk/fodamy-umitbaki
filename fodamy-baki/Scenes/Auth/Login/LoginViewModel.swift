//
//  LoginViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 27.01.2023.
//

import Foundation

protocol LoginViewDataSource {}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    
}
