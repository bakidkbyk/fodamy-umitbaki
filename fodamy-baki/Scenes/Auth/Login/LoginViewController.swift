//
//  LoginViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 27.01.2023.
//

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
    
    private let usernameTextField = FloatLabelTextField()
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
    
    // MARK: - LiceCycle
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
        contentStackView.addArrangedSubview(forgotPasswordButtonContainerView)
    }
    
    private func addBodyStackView() {
        bodyStackView.addArrangedSubview(usernameTextField)
        usernameTextField.height(60)
        
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
        
        usernameTextField.leftImage = .icUser
        usernameTextField.autocapitalizationType = .none
        usernameTextField.autocorrectionType = .no
        
        passwordTextField.leftImage = .icPassword
        passwordTextField.isSecureTextEntry = true
        
        actionLoginButton.addTarget(self, action: #selector(actionLoginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.Login.title
        usernameTextField.title = L10n.Login.usernamePlaceHolder
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
        guard let username = usernameTextField.text,
              let password = passwordTextField.text else {
            self.showWarningToast(message: L10n.Login.emptyFields)
            return
        }
        
        let validation = Validation()
        guard validation.isValidPassword(password) else { return }
        
        viewModel.sendLoginRequest(username: username, password: password)
    }
    
    @objc
    func forgotPasswordButtonTapped() {
        viewModel.showForgotPasswordScreen()
    }
    
    @objc
    func registerButtonTapped() {
        viewModel.showRegisterScreen()
    }
}
