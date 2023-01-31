//
//  ForgotPasswordViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 31.01.2023.
//

import Foundation

protocol ForgotPasswordViewDataSource {}

protocol ForgotPasswordViewEventSource {}

protocol ForgotPasswordViewProtocol: ForgotPasswordViewDataSource, ForgotPasswordViewEventSource {
    func sendRefresfPasswordRequest(email: String)
}

final class ForgotPasswordViewModel: BaseViewModel<ForgotPasswordRouter>, ForgotPasswordViewProtocol {}

// MARK: - Network
extension ForgotPasswordViewModel {
    
    func sendRefresfPasswordRequest(email: String) {
        showLoading?()
        dataProvider.request(for: ForgotPasswordRequest(email: email)) { [ weak self ] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success:
                self.showWarningToast?(L10n.ForgotPassword.isSuccess)
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
