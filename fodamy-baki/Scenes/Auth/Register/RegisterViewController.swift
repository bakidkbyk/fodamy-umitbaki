//
//  RegisterViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 24.01.2023.
//

import UIKit
import MobilliumBuilders

final class RegisterViewController: BaseViewController<RegisterViewModel> {
    
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
    
    private let usernameTextField = FloatLabelTextField()
    private let emailTextField    = FloatLabelTextField()
    private let passwordTextField = FloatLabelTextField()
    
    private let signUpButton = ButtonFactory.createPrimaryButton(style: .large)
    
    private let bottomStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(4)
        .build()
    
    private let bottomLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appRaven)
        .build()
    
    private let loginButton = UIButtonBuilder()
        .titleColor(.appRed)
        .titleFont(.font(.nunitoBold, size: .xLarge))
        .build()
    
    // MARK: - LiceCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
    
}

// MARK: - UILayout
extension RegisterViewController {
    
    private func addSubViews() {
        addScrollView()
        addContentStackView()
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
        titleLabel.centerX(to: contentStackView)
        
        contentStackView.addArrangedSubview(usernameTextField)
        usernameTextField.height(60)
        contentStackView.setCustomSpacing(15, after: usernameTextField)
        
        contentStackView.addArrangedSubview(emailTextField)
        emailTextField.height(60)
        contentStackView.setCustomSpacing(15, after: emailTextField)
        
        contentStackView.addArrangedSubview(passwordTextField)
        passwordTextField.height(60)
        contentStackView.setCustomSpacing(15, after: passwordTextField)
        
        contentStackView.addArrangedSubview(signUpButton)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        signUpButton.height(60)
    }
    
    private func addBottomStackView() {
        view.addSubview(bottomStackView)
        
        bottomStackView.addArrangedSubview(bottomLabel)
        bottomStackView.addArrangedSubview(loginButton)
        
        bottomStackView.centerXToSuperview()
        bottomStackView.topToBottom(of: scrollView).constant = 20
        
        bottomStackView.bottomToSuperview(usingSafeArea: true)
        bottomStackView.leadingToSuperview(relation: .equalOrGreater).constant = 20
        bottomStackView.trailingToSuperview(relation: .equalOrLess).constant = -20
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Configure And Localize
extension RegisterViewController {
    
    private func configureContents() {
        setLocalize()
        
        usernameTextField.leftImage = .icUser
        emailTextField.leftImage = .icMail
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.keyboardType = .emailAddress
        passwordTextField.leftImage = .icPassword
        passwordTextField.isSecureTextEntry = true
        
        view.backgroundColor = .white
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.title
        usernameTextField.title = L10n.username
        emailTextField.title = L10n.email
        passwordTextField.title = L10n.password
        signUpButton.setTitle(L10n.signUpButtonText, for: .normal)
        loginButton.setTitle(L10n.bottomButtonText, for: .normal)
        bottomLabel.text = L10n.bottomLabelText
    }
}
// MARK: - Actions
extension RegisterViewController {
    
    @objc
    func loginButtonTapped() {
        viewModel.showLoginScreen()
    }
    
    @objc
    func signUpButtonTapped() {
        guard let username = usernameTextField.text,
              let email    = emailTextField.text,
              let password = passwordTextField.text else {
            showWarningToast(message: L10n.emptyFields)
            return
        }
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        guard validation.isValidPassword(password) else { return }
        
        viewModel.sendRegisterRequest(username: username, email: email, password: password)
    }
}
