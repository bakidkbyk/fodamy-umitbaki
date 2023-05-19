//
//  CommentAndLikesView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 4.04.2023.
//

import UIKit

public class RecipeDetailsInfoView: UIView {
    
    private let recipeDetailsInfoStackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()

    private let recipeNameLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appCinder)
        .build()
    
    private let categoryNameLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge ))
        .textColor(.appRaven)
        .build()
    
    private let timeLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textColor(.appRaven)
        .textAlignment(.right)
        .build()
    
    public var recipeName: String? {
        willSet {
            recipeNameLabel.text = newValue
        }
    }
    
    public var categoryName: String? {
        willSet {
            categoryNameLabel.text = newValue
        }
    }
    
    public var timeCounter: String? {
        willSet {
            timeLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}

// MARK: - UILayouts
extension RecipeDetailsInfoView {
    
    private func addSubViews() {
        backgroundColor = .appWhite
        addSubview(recipeDetailsInfoStackView)
        recipeDetailsInfoStackView.edgesToSuperview(excluding: .trailing, insets: UIEdgeInsets(top: 11, left: 15, bottom: 11, right: 0))
        
        recipeDetailsInfoStackView.addArrangedSubview(recipeNameLabel)
        recipeDetailsInfoStackView.addArrangedSubview(categoryNameLabel)
        
        addSubview(timeLabel)
        timeLabel.leadingToTrailing(of: recipeDetailsInfoStackView).constant = 10
        timeLabel.trailingToSuperview().constant = -15
        timeLabel.centerYToSuperview()
    }
}
