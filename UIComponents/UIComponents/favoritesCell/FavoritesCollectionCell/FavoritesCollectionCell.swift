//
//  FavoritesCollectionCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 5.03.2023.
//

public class FavoritesCollectionCell: UICollectionViewCell, ReusableView {
    
    private var recipeImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFill)
        .cornerRadius(10)
        .clipsToBounds(true)
        .build()
    
    private let userImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .cornerRadius(15)
        .clipsToBounds(true)
        .masksToBounds(true)
        .borderWidth(3)
        .borderColor(UIColor.appRed.cgColor)
        .build()

    private let usernameLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.topPadding = 20
        label.bottomPadding = 20
        label.leftPadding = 12
        label.rightPadding = 8
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        label.font = .font(.nunitoBold, size: .xSmall)
        label.backgroundColor = .appRed
        label.textColor = .appWhite
        return label
    }()
    
    private let labelContainerView = UIViewBuilder()
        .build()
    
    private let labelContainerStackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private let recipeTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xSmall))
        .textColor(.appCinder)
        .build()
    
    private var likesAndCommentLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xSmall))
        .textColor(.appRaven)
        .build()

    var viewModel: FavoritesCollectionCellProtocol?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
        configureContents()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        recipeImageView.image = nil
        userImageView.image = nil
        usernameLabel.text = nil
        recipeTitleLabel.text = nil
        likesAndCommentLabel.text = nil
    }
}

// MARK: UILayout
extension FavoritesCollectionCell {
    
    private func addSubViews() {
        addRecipeImageView()
        addUserImageView()
        addUsernameLabel()
        addLabelContainerView()
    }

    private func addRecipeImageView() {
        contentView.addSubview(recipeImageView)
        recipeImageView.aspectRatio(1)
        recipeImageView.edgesToSuperview(excluding: .bottom)
    }
    
    private func addUserImageView() {
        contentView.addSubview(userImageView)
        userImageView.top(to: recipeImageView).constant = 5
        userImageView.leading(to: recipeImageView).constant = 5
        
    }
    
    private func addUsernameLabel() {
        contentView.addSubview(usernameLabel)
        usernameLabel.leadingToTrailing(of: userImageView).constant = -10
        usernameLabel.centerY(to: userImageView)

    }
    
    private func addLabelContainerView() {
        contentView.addSubview(labelContainerView)
        labelContainerView.topToBottom(of: recipeImageView)
        labelContainerView.edgesToSuperview(excluding: .top)
        
        labelContainerView.addSubview(labelContainerStackView)
        labelContainerStackView.centerYToSuperview()
        labelContainerStackView.leadingToSuperview().constant = 10
        labelContainerStackView.trailingToSuperview().constant = -10
        labelContainerStackView.addArrangedSubview(recipeTitleLabel)
        labelContainerStackView.addArrangedSubview(likesAndCommentLabel)
    }
}

// MARK: - Configure Contents
extension FavoritesCollectionCell {
    
    private func configureContents() {
        contentView.backgroundColor = .white
        contentView.bringSubviewToFront(userImageView)
        userImageView.size(.init(width: 30, height: 30))
        usernameLabel.height(20)
        contentView.layer.cornerRadius = 4
        layer.cornerRadius = 4
        layer.masksToBounds = false
        contentView.clipsToBounds = true
        layer.shadowColor = UIColor.appCinder.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.2
    }
}

// MARK: - Set View Model
public extension FavoritesCollectionCell {
    
    func set(viewModel: FavoritesCollectionCellProtocol) {
        self.viewModel = viewModel
        self.recipeImageView.setImage(viewModel.recipeImage)
        self.userImageView.setImage(viewModel.userImage)
        self.usernameLabel.text = viewModel.username
        self.recipeTitleLabel.text = viewModel.recipeTitle
        self.likesAndCommentLabel.text = viewModel.commentAndLikes
    }
}
