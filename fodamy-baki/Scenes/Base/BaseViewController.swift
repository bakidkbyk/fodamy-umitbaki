//
//  BaseViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.01.2023.
//

import UIKit

class BaseViewController<V: BaseViewModelProtocol>: UIViewController, BaseViewController.LoadingProtocols {
    
    typealias LoadingProtocols = LoadingProtocol & ActivityIndicatorProtocol
    
    private let tryAgainButton = UIButtonBuilder()
        .titleColor(.appWhite)
        .titleFont(.font(.nunitoBold, size: .xLarge))
        .build()
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        subscribeLoading()
        subscribeActivityIndicator()
        subscribeToast()
        
    }
    
    private func addTryAgainButton() {
        view.addSubview(tryAgainButton)
        tryAgainButton.centerInSuperview()
        tryAgainButton.size(CGSize(width: 200, height: 50))
        tryAgainButton.setTitle(L10n.BaseViewController.errorTitle, for: .normal)
        tryAgainButton.backgroundColor = .appRed
        tryAgainButton.addTarget(self, action: #selector(tryAgainButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func tryAgainButtonTapped() {
        viewModel.tryAgainButtonTapped()
    }
    
    func subscribeShowTryAgainButton() {
        viewModel.showTryAgainButton = { [weak self] in
            self?.addTryAgainButton()
        }
    }
    
    func subscribeHideTryAgainButton() {
        viewModel.hideTryAgainButton = { [weak self] in
            self?.tryAgainButton.removeFromSuperview()
        }
    }
    
    private func subscribeActivityIndicator() {
        viewModel.showActivityIndicatorView = { [weak self] in
            self?.showActivityIndicator(indicatorType: .center)
        }
        viewModel.showActivityIndicatorBottomView = { [weak self] in
            self?.showActivityIndicator(indicatorType: .bottom)
        }
        viewModel.hideActivityIndicatorView = { [weak self] in
            self?.hideActivityIndicator()
        }
    }
    
    private func subscribeLoading() {
        viewModel.showLoading = { [weak self] in
            self?.presentLoading()
        }
        viewModel.hideLoading = { [weak self] in
            self?.dismissLoading()
        }
    }
    
    private func subscribeToast() {
        viewModel.showWarningToast = { text in
            ToastPresenter.showWarningToast(text: text)
        }
    }
    
    func showWarningToast(message: String) {
        ToastPresenter.showWarningToast(text: message)
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
