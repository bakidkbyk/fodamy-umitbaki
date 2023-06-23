//
//  LoginWarningUpViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 23.06.2023.
//

final class LoginWarningUpViewController: BaseViewController<LoginWarningUpViewModel> {
    
    private let contentView = UIViewBuilder()
        .backgroundColor(.appWhite)
        .build()
    
    private let warningImageView = UIImageViewBuilder()
        .tintColor(.appYellow)
        .contentMode(.scaleToFill)
        .cornerRadius(22)
        .clipsToBounds(true)
        .build()
    
    private let warningLabel = UILabelBuilder()
        .textColor(.appCinder)
        .font(.font(.nunitoSemiBold, size: .xxLarge))
        .textAlignment(.center)
        .build()
    
    private let buttonStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .distribution(.fillEqually)
        .build()
    
    private let loginButton = UIButtonBuilder()
        .titleFont(.font(.nunitoBold, size: .xxLarge))
        .titleColor(.appWhite)
        .backgroundColor(.appRed)
        .build()
    
    private let giveUpButton = UIButtonBuilder()
        .titleFont(.font(.nunitoBold, size: .xxLarge))
        .titleColor(.appSecondaryBackground)
        .backgroundColor(.appHeather)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContent()
        setLocalize()
    }
}

// MARK: - UILayout
extension LoginWarningUpViewController {
    
    private func addSubviews() {
        view.addSubview(contentView)
        contentView.centerYToSuperview()
        contentView.leadingToSuperview().constant = 25
        contentView.trailingToSuperview().constant = -25
        
        contentView.addSubview(warningImageView)
        warningImageView.centerXToSuperview()
        warningImageView.topToSuperview().constant = 20
        
        contentView.addSubview(warningLabel)
        warningLabel.topToBottom(of: warningImageView).constant = 16
        warningLabel.edgesToSuperview(excluding: [.top, .bottom])
        
        contentView.addSubview(buttonStackView)
        buttonStackView.topToBottom(of: warningLabel).constant = 15
        buttonStackView.edgesToSuperview(excluding: .top)
        
        buttonStackView.addArrangedSubview(giveUpButton)
        buttonStackView.addArrangedSubview(loginButton)
    }
}

// MARK: - ConfigureContent
extension LoginWarningUpViewController {
    
    private func configureContent() {
        view.backgroundColor = UIColor.clear.withAlphaComponent(0.50)
        view.isOpaque = false
        
        warningImageView.size(.init(width: 60, height: 60))
        warningImageView.image = .icWarning.withRenderingMode(.alwaysTemplate)
        giveUpButton.height(50)
        loginButton.height(50)
        
        giveUpButton.addTarget(self, action: #selector(giveUpButtonAction), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
}

// MARK: - SetLocalize
extension LoginWarningUpViewController {
    
    private func setLocalize() {
        warningLabel.text = L10n.LoginWarningUp.warningLabel
        giveUpButton.setTitle(L10n.LoginWarningUp.giveUpButton, for: .normal)
        loginButton.setTitle(L10n.LoginWarningUp.loginButton, for: .normal)
    }
}

// MARK: - Actions
extension LoginWarningUpViewController {
    
    @objc
    private func giveUpButtonAction() {
        viewModel.giveUpButtonAction()
    }
    
    @objc
    private func loginButtonAction() {
        viewModel.loginButtonAction()
    }
}
