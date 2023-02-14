//
//  RecipeCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 13.02.2023.
//

import MobilliumBuilders

public class RecipeCell: UICollectionViewCell, ReusableView {
    
    private let userView = UIViewBuilder()
        .build()
    
    private let userImageAndInfoStackView = UIStackViewBuilder()
        .spacing(10)
        .axis(.horizontal)
        .build()
    
    private let userImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFill)
        .build()
    
    private let userInfoStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(4)
        .build()
    
    private let usernameLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xSmall))
        .textColor(.appZircon)
        .build()
    
    private let recipeCountAndFollowersLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textColor(.appHeather)
        .build()
    
    private let recipeDescriptionStackView = UIStackViewBuilder()
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

    private let foodImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
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
        
    }
    
    private func addUserView() {
        contentView.addSubview(userView)
        
        userView.edgesToSuperview(excluding: .bottom, insets: TinyEdgeInsets(top: 30, left: 0, bottom: 0, right: 0), usingSafeArea: true)
        
        userView.addSubview(userImageAndInfoStackView)
        
      
        
        
        userImageAndInfoStackView.addArrangedSubview(userImageView)
        userImageAndInfoStackView.addArrangedSubview(userInfoStackView)
        
        userInfoStackView.addArrangedSubview(usernameLabel)
        userInfoStackView.addArrangedSubview(recipeCountAndFollowersLabel)
    }
    
   
}
