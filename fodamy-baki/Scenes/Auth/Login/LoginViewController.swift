//
//  LoginViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 27.01.2023.
//

import UIKit
import MobilliumBuilders

final class LoginViewController: BaseViewController<LoginViewModel> {
    
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
    
    private let bodyStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(15)
        .build()
    
    private let emailTextField    = FloatLabelTextField()
    private let passwordTextField = FloatLabelTextField()
    private let loginButton       = ButtonFactory.createPrimaryButton(style: .large)
    private let forgotPasswordButton = UIButtonBuilder()
        .build()
    
    private let bottomStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(4)
        .build()
    
    private let loginLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appRaven)
        .build()
    
    private let registerButton = UIButtonBuilder()
        .titleFont(.font(.nunitoBold, size: .xLarge))
        .titleColor(.appRed)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
    }
    
}

// MARK: - UILayout
extension LoginViewController {

    private func addSubViews() {
        addScrollView()
        addContentStackView()
        addBodyStackView()
        addBottomStackView()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .left(15) + .right(15))
    }
    
    private func addContentStackView() {
        contentStackView.addArrangedSubview(titleLabel)
        
        contentStackView.addArrangedSubview(bodyStackView)
    }
    
    private func addBodyStackView() {
        bodyStackView.addArrangedSubview(emailTextField)
        emailTextField.height(60)
        
        bodyStackView.addArrangedSubview(passwordTextField)
        passwordTextField.height(60)
        
        bodyStackView.addArrangedSubview(loginButton)
        loginButton.height(60)
        
        bodyStackView.addArrangedSubview(forgotPasswordButton)
        forgotPasswordButton.edgesToSuperview(excluding: .leading)
    }
    
    private func addBottomStackView() {
        view.addSubview(bottomStackView)
        
        bottomStackView.addArrangedSubview(emailTextField)
        bottomStackView.addArrangedSubview(passwordTextField)
        
        bottomStackView.centerXToSuperview()
        bottomStackView.topToBottom(of: scrollView).constant = 20
        bottomStackView.edgesToSuperview(usingSafeArea: true)
        bottomStackView.leadingToSuperview(relation: .equalOrGreater).constant = 20
        bottomStackView.trailingToSuperview(relation:.equalOrLess).constant = -20
    }
    
}

// MARK: - Configure Contents and Localize
extension LoginViewController {
    private func configureContents() {
        view.backgroundColor = .appWhite
        
        emailTextField.leftImage = .icMail
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.keyboardType = .emailAddress
        passwordTextField.leftImage = .icPassword
        passwordTextField.isSecureTextEntry = true
        
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.Login.title
        emailTextField.text = L10n.Login.emailPlaceHolder
        passwordTextField.text = L10n.Login.passwordPlaceHolder
        
        
    }
}
