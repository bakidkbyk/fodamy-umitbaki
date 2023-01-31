//
//  ForgotPasswordViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 31.01.2023.
//

import MobilliumBuilders
import UIComponents

final class ForgotPasswordViewController: BaseViewController<ForgotPasswordViewModel> {
    
    private let scrollView = UIScrollViewBuilder()
        .build()
    
    private let contentView = UIViewBuilder()
        .build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(50)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xxLarge))
        .textAlignment(.center)
        .textColor(.appCinder)
        .build()
    
    private let emailTextField = FloatLabelTextField()
    private let refreshPasswordButton = ButtonFactory.createPrimaryButton(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setLocalize()
        configureContents()
    }
}

// MARK: - UILayout
extension ForgotPasswordViewController {
    private func addSubViews() {
        addScrollView()
        addContentStackView()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(usingSafeArea: true)
        
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .left(15) + .right(15))
    }
    
    private func addContentStackView() {
        contentStackView.addArrangedSubview(titleLabel)
        
        contentStackView.addArrangedSubview(emailTextField)
        contentStackView.setCustomSpacing(15, after: emailTextField)
        
        contentStackView.addArrangedSubview(refreshPasswordButton)
    }
}

// MARK: - Configure Contents and Localize
extension ForgotPasswordViewController {
    private func configureContents() {
        view.backgroundColor = .appWhite
        
        emailTextField.leftImage = .icMail
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        
        refreshPasswordButton.addTarget(self, action: #selector(refreshPasswordButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.ForgotPassword.title
        emailTextField.title = L10n.ForgotPassword.emailPlaceHolder
        refreshPasswordButton.setTitle(L10n.ForgotPassword.refreshPasswordButtonText, for: .normal)
    }

}

// MARK: - Actions
extension ForgotPasswordViewController {
    
    @objc
    func refreshPasswordButtonTapped() {
        guard let email = emailTextField.text else {
            showWarningToast(message: L10n.ForgotPassword.emptyEmailAdress)
            return
        }
        
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        
        viewModel.sendRefresfPasswordRequest(email: email)
    }
}
