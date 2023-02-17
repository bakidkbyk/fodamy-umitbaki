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
        .backgroundColor(.appWhite)
        .build()
    
    private let recipeTitleStackView = UIStackViewBuilder()
        .spacing(4)
        .axis(.vertical)
        .build()
    
    private let recipeTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appZircon)
        .build()
    
    private let recipeDescriptionLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appHeather)
        .build()

    private let recipeImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFill)
        .cornerRadius(5)
        .clipsToBounds(true)
        .build()
    
    private let commentAndLikeContainerView = UIViewBuilder()
        .build()
    
    private let commentAndLikeStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(2)
        .build()
    
    private let commentLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appHeather)
        .build()

    private let likesLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appHeather)
        .build()
    
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
        recipeTitleContainerView.topToBottom(of: lineView).constant = 11
        recipeTitleContainerView.edgesToSuperview(excluding: [.trailing, .bottom])
        recipeTitleContainerView.leadingToSuperview().constant = 15
        recipeTitleContainerView.height(61)
        
        recipeTitleContainerView.addSubview(recipeTitleStackView)
        recipeTitleStackView.edgesToSuperview(excluding: [.top, .bottom])
        recipeTitleStackView.centerYToSuperview()
    }
    
    private func addRecipeImageView() {
        contentView.addSubview(recipeImageView)
        recipeImageView.edgesToSuperview(excluding: .bottom, insets: .init(top: 10, left: 15, bottom: 0, right: 15))
        recipeImageView.height(345)
    }
    
    private func addCommentAndLikeContainerView() {
        contentView.addSubview(commentAndLikeContainerView)
        commentAndLikeContainerView.edgesToSuperview(excluding: [.trailing, .bottom], insets: .init(top: 13, left: 15, bottom: 0, right: 0))
        
        commentAndLikeContainerView.addSubview(commentAndLikeStackView)
        commentAndLikeStackView.edgesToSuperview()
    }
}
