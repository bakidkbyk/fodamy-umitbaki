//
//  RegisterViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 24.01.2023.
//

final class RegisterViewController: BaseViewController<RegisterViewModel> {
    
   // MARK: - Variables
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
    private let emailTextField    = FloatLabelTextField()
    private let passwordTextField = FloatLabelTextField()
    private let signUpButton      = ButtonFactory.createPrimaryButton(style: .large)
    
    private let bottomStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(4)
        .build()
    
    private let registerLabel = UILabelBuilder()
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
        setLocalize()
        configureContents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationItem.setHidesBackButton(false, animated: false)
    }
}

// MARK: - UILayout
extension RegisterViewController {
    
    private func addSubViews() {
        addScrollView()
        addContentStackView()
        addTextFieldStackView()
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
    
    private func addTextFieldStackView() {
        
        bodyStackView.addArrangedSubview(usernameTextField)
        usernameTextField.height(60)
        
        bodyStackView.addArrangedSubview(emailTextField)
        emailTextField.height(60)
        
        bodyStackView.addArrangedSubview(passwordTextField)
        passwordTextField.height(60)
        
        bodyStackView.addArrangedSubview(signUpButton)
        signUpButton.height(60)
    }
    
    private func addBottomStackView() {
        view.addSubview(bottomStackView)
        
        bottomStackView.addArrangedSubview(registerLabel)
        bottomStackView.addArrangedSubview(loginButton)
        
        bottomStackView.centerXToSuperview()
        bottomStackView.leadingToSuperview(relation: .equalOrGreater).constant = 20
        bottomStackView.trailingToSuperview(relation: .equalOrLess).constant = -20
        bottomStackView.bottomToSuperview(usingSafeArea: true)
        bottomStackView.topToBottom(of: scrollView).constant = 20
    }
}

// MARK: - Configure And Localize
extension RegisterViewController {
    
    private func configureContents() {
        view.backgroundColor = .appWhite
        
        usernameTextField.leftImage = .icUser
        usernameTextField.autocorrectionType = .no
        usernameTextField.autocapitalizationType = .none
        
        emailTextField.leftImage = .icMail
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.keyboardType = .emailAddress
        
        passwordTextField.leftImage = .icPassword
        passwordTextField.isSecureTextEntry = true
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.Register.title
        usernameTextField.title = L10n.Register.usernamePlaceHolder
        emailTextField.title = L10n.Register.emailPlaceHolder
        passwordTextField.title = L10n.Register.passwordPlaceHolder
        signUpButton.setTitle(L10n.Register.signUpButtonText, for: .normal)
        loginButton.setTitle(L10n.Register.bottomButtonText, for: .normal)
        registerLabel.text = L10n.Register.bottomLabelText
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
            showWarningToast(message: L10n.Register.emptyFields)
            return
        }
        
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        guard validation.isValidPassword(password) else { return }
        
        viewModel.sendRegisterRequest(username: username, email: email, password: password)
    }
}
