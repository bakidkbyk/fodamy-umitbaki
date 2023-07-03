//
//  File.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 16.02.2023.
//

public class UserView: UIView {
    
    private let userImageView = UIImageViewBuilder()
        .contentMode(.scaleToFill)
        .cornerRadius(20)
        .clipsToBounds(true)
        .build()
    
    private let userInfoStackView = UIStackViewBuilder()
        .axis(.vertical)
        .distribution(.fillEqually)
        .build()
    
    private let usernameLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textColor(.appCinder)
        .build()
    
    private let recipeCountAndFollowersLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textColor(.appRaven)
        .build()
    
    private let followButtonStackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private lazy var followButton = ButtonFactory.createPrimaryBorderedButton(style: .small)
    
    public var userImgUrl: String? {
        didSet {
            if let url = userImgUrl, !url.isEmpty {
                userImageView.setImage(url)
            } else {
                userImageView.image = .icUser
            }
        }
    }
    
    public var username: String? {
        willSet {
            usernameLabel.text = newValue
        }
    }
    
    public var recipeCountAndFollowersLabelText: String? {
        willSet {
            recipeCountAndFollowersLabel.text = newValue
        }
    }
    
    public var  isShowsFollowButton = false {
        didSet {
            followButton.isHidden = !isShowsFollowButton
        }
    }
    
    public var isFollowing = false {
        didSet {
            updateFollowButton()
        }
    }
    
    public var followButtonTitle: String? {
        willSet {
            followButton.setTitle(newValue, for: .normal)
        }
    }
    
    public var followButtonTapped: VoidClosure?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContent()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
}

// MARK: - UILayout
extension UserView {
    
    private func addSubviews() {
        addSubview(userImageView)
        userImageView.edgesToSuperview(excluding: .trailing, insets: .init(top: 15, left: 15, bottom: 15, right: 15))
        userImageView.size(.init(width: 40, height: 40))
        
        addSubview(userInfoStackView)
        userInfoStackView.leadingToTrailing(of: userImageView).constant = 10
        userInfoStackView.centerYToSuperview()
        userInfoStackView.addArrangedSubview(usernameLabel)
        userInfoStackView.addArrangedSubview(recipeCountAndFollowersLabel)
        
        addSubview(followButtonStackView)
        followButtonStackView.trailingToSuperview().constant = -15
        followButtonStackView.leadingToTrailing(of: userInfoStackView).constant = 15
        followButtonStackView.centerYToSuperview()
        followButtonStackView.width(120)
        followButtonStackView.addArrangedSubview(followButton)
    }
}

// MARK: - Configure Contents
extension UserView {
    
    private func configureContent() {
        backgroundColor = .appWhite
        followButton.addTarget(self, action: #selector(followButtonAction), for: .touchUpInside)
    }
    
    private func updateFollowButton() {
        if isFollowing {
            followButton.setTitle(L10n.RecipeDetails.following, for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.backgroundColor = .appRed
        } else {
            followButton.setTitle(L10n.RecipeDetails.follow, for: .normal)
            followButton.setTitleColor(.appRed, for: .normal)
            followButton.backgroundColor = .appWhite
        }
    }
}

// MARK: - Actions
extension UserView {
    
    @objc
    func followButtonAction() {
        followButtonTapped?()
    }
}
