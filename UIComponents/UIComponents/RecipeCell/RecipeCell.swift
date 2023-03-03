//
//  RecipeCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 13.02.2023.
//

public class RecipeCell: UICollectionViewCell, ReusableView {
    
    private let userView = UserView()
    
    private let lineView = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    
    private let recipeTitleContainerView = UIViewBuilder()
        .build()
    
    private let recipeTitleStackView = UIStackViewBuilder()
        .axis(.vertical)
        .distribution(.fillEqually)
        .build()
    
    private let recipeTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appCinder)
        .build()
    
    private let categoryNameLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appRaven)
        .build()

    private let recipeImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFill)
        .cornerRadius(4)
        .clipsToBounds(true)
        .build()
    
    private let editoryPickImageView = UIImageViewBuilder()
        .image(UIImage.imgEditorsPick.resize(to: .init(width: 20, height: 24), for: .scaleAspectFit))
        .cornerRadius(20)
        .shadowColor(UIColor.appCinder.cgColor)
        .backgroundColor(.appWhite)
        .shadowOpacity(40)
        .shadowRadius(4)
        .shadowOffset(.zero)
        .contentMode(.center)
        .build()
    
    private let commentAndLikeStakView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private let commentAndLikesLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appRaven)
        .build()

    var viewModel: RecipeCellProtocol?
    
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
        userView.userImgUrl = nil
        userView.username = nil
        userView.userImgUrl = nil
        recipeTitleLabel.text = nil
        categoryNameLabel.text = nil
        recipeImageView.image = nil
        commentAndLikesLabel.text = nil
    }
}

// MARK: - UILayout
extension RecipeCell {
    
    private func addSubViews() {
        addUserView()
        addLineView()
        addRecipeTitleContainerView()
        addRecipeImageView()
        addEditoryPickImageView()
        addCommentAndLikeStakView()
    }
    
    private func addUserView() {
        contentView.addSubview(userView)
        userView.edgesToSuperview(excluding: .bottom)
        userView.height(70)
    }
    
    private func addLineView() {
        contentView.addSubview(lineView)
        lineView.topToBottom(of: userView)
        lineView.edgesToSuperview(excluding: [.top, .bottom])
        lineView.height(1)
    }
    
    private func addRecipeTitleContainerView() {
        contentView.addSubview(recipeTitleContainerView)
        recipeTitleContainerView.topToBottom(of: lineView)
        recipeTitleContainerView.leadingToSuperview().constant = 15
        recipeTitleContainerView.trailingToSuperview().constant = -15
        recipeTitleContainerView.height(61)
        
        recipeTitleContainerView.addSubview(recipeTitleStackView)
        recipeTitleStackView.edgesToSuperview(excluding: [.top, .bottom])
        recipeTitleStackView.centerYToSuperview()
        recipeTitleStackView.addArrangedSubview(recipeTitleLabel)
        recipeTitleStackView.addArrangedSubview(categoryNameLabel)
    }
    
    private func addRecipeImageView() {
        contentView.addSubview(recipeImageView)
        recipeImageView.topToBottom(of: recipeTitleStackView)
        recipeImageView.leadingToSuperview().constant = 15
        recipeImageView.trailingToSuperview().constant = -15
        recipeImageView.aspectRatio(1)
        
    }
    
    private func addEditoryPickImageView() {
        contentView.addSubview(editoryPickImageView)
        editoryPickImageView.top(to: recipeImageView).constant = 15
        editoryPickImageView.trailing(to: recipeImageView).constant = -15
        editoryPickImageView.size(.init(width: 40, height: 40))
    }
    
    private func addCommentAndLikeStakView() {
        contentView.addSubview(commentAndLikeStakView)
        commentAndLikeStakView.topToBottom(of: recipeImageView)
        commentAndLikeStakView.leadingToSuperview().constant = 15
        commentAndLikeStakView.trailingToSuperview().constant = -15
        commentAndLikeStakView.height(45)
        
        commentAndLikeStakView.addArrangedSubview(commentAndLikesLabel)
        commentAndLikesLabel.edgesToSuperview(excluding: [.top, .bottom])
        commentAndLikesLabel.centerYToSuperview()
    }
}

// MARK: - Configure Contents
extension RecipeCell {
    
    private func configureContents() {
        backgroundColor = .appWhite
        userView.isShowsFollowButton = false
    }
}

// MARK: - Set View Model
public extension RecipeCell {
    
    func set(viewModel: RecipeCellProtocol) {
        self.viewModel = viewModel
        userView.username = viewModel.username
        userView.userImgUrl = viewModel.usernameImageUrl
        userView.recipeCountAndFollowersLabelText = viewModel.recipeAndFollowers
        recipeTitleLabel.text = viewModel.recipeTitle
        categoryNameLabel.text = viewModel.categoryName
        recipeImageView.setImage(viewModel.recipeImageUrl)
        commentAndLikesLabel.text = viewModel.commentAndLikes
        editoryPickImageView.isHidden = !viewModel.isEditorChoice
    }
}
