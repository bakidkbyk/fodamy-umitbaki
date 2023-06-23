//
//  LoginWarningUpViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 23.06.2023.
//

import Foundation

protocol LoginWarningUpViewDataSource {}

protocol LoginWarningUpViewEventSource {}

protocol LoginWarningUpViewProtocol: LoginWarningUpViewDataSource, LoginWarningUpViewEventSource {}

final class LoginWarningUpViewModel: BaseViewModel<LoginWarningUpRouter>, LoginWarningUpViewProtocol {
    
}
