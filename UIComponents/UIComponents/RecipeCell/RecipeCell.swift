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
    
    private let commentAndLikeContainerView = UIViewBuilder()
        .build()
    
    private let commentAndLikesLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appRaven)
        .build()

    var viewModel: RecipeCellProtocol?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
    }
}

// MARK: - UILayout
extension RecipeCell {
    
    private func addSubViews() {
        backgroundColor = .appWhite
        addUserView()
        addLineView()
        addRecipeTitleContainerView()
        addRecipeImageView()
        addCommentAndLikeContainerView()
        userView.isShowsFollowButton = false
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
        recipeImageView.topToBottom(of: recipeTitleContainerView)
        recipeImageView.leadingToSuperview().constant = 15
        recipeImageView.trailingToSuperview().constant = -15
        recipeImageView.aspectRatio(1)
        
    }
    
    private func addCommentAndLikeContainerView() {
        contentView.addSubview(commentAndLikeContainerView)
        commentAndLikeContainerView.topToBottom(of: recipeImageView)
        commentAndLikeContainerView.leadingToSuperview().constant = 15
        commentAndLikeContainerView.trailingToSuperview().constant = -15
        commentAndLikeContainerView.height(45)
        
        commentAndLikeContainerView.addSubview(commentAndLikesLabel)
        commentAndLikesLabel.edgesToSuperview(excluding: [.top, .bottom])
        commentAndLikesLabel.centerYToSuperview()
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
    }
}
