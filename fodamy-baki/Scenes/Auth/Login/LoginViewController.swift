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
    private let actionLoginButton = ButtonFactory.createPrimaryButton(style: .large)
    
    private let forgotPasswordButtonContainerView = UIViewBuilder()
        .build()
    private let forgotPasswordButton = UIButtonBuilder()
        .titleFont(.font(.nunitoSemiBold, size: .large))
        .titleColor(.appRaven)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationItem.setHidesBackButton(true, animated: false)
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
        contentStackView.addArrangedSubview(forgotPasswordButtonContainerView)
    }
    
    private func addBodyStackView() {
        bodyStackView.addArrangedSubview(emailTextField)
        emailTextField.height(60)
        
        bodyStackView.addArrangedSubview(passwordTextField)
        passwordTextField.height(60)
        
        bodyStackView.addArrangedSubview(actionLoginButton)
        actionLoginButton.height(60)
        
        bodyStackView.addArrangedSubview(forgotPasswordButtonContainerView)
        
        forgotPasswordButtonContainerView.addSubview(forgotPasswordButton)
        forgotPasswordButton.edgesToSuperview(excluding: .leading)
        
    }
    
    private func addBottomStackView() {
        view.addSubview(bottomStackView)
        
        bottomStackView.addArrangedSubview(loginLabel)
        bottomStackView.addArrangedSubview(registerButton)
        
        bottomStackView.centerXToSuperview()
        bottomStackView.leadingToSuperview(relation: .equalOrGreater).constant = 20
        bottomStackView.trailingToSuperview(relation: .equalOrLess).constant = -20
        bottomStackView.bottomToSuperview(usingSafeArea: true)
        bottomStackView.topToBottom(of: scrollView).constant = 20
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
        
        actionLoginButton.addTarget(self, action: #selector(actionLoginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        
        self.navigationItem.setHidesBackButton(false, animated: true)
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.Login.title
        emailTextField.title = L10n.Login.emailPlaceHolder
        passwordTextField.title = L10n.Login.passwordPlaceHolder
        forgotPasswordButton.setTitle(L10n.Login.forgotPasswordButtonText, for: .normal)
        actionLoginButton.setTitle(L10n.Login.loginButtonText, for: .normal)
        loginLabel.text = L10n.Login.bottomLabelText
        registerButton.setTitle(L10n.Login.bottomButtonText, for: .normal)
        
    }
}

// MARK: - Actions
extension LoginViewController {
    
    @objc
    func actionLoginButtonTapped() {
        
    }
    
    @objc
    func forgotPasswordButtonTapped() {
        
    }
    
    @objc
    func registerButtonTapped() {
        viewModel.showRegisterScreen()
    }
}
