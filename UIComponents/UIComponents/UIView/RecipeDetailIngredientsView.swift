//
//  RecipeIngredientsView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 30.05.2023.
//

import UIKit
import MobilliumBuilders

public class RecipeDetailIngredientsView: UIView {
    
    private let topContainerView = UIViewBuilder()
        .backgroundColor(.appWhite)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appCinder)
        .build()
    
    private let stackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(1)
        .alignment(.center)
        .build()
    
    private let iconImageView = UIImageViewBuilder()
        .cornerRadius(15)
        .clipsToBounds(true)
        .contentMode(.center)
        .tintColor(.appCinder)
        .size(.init(width: 34, height: 34))
        .build()
    
    private let iconImageSubtitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .small))
        .textColor(.appRaven)
        .build()
    
    private let seperatorView = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    
    private let ingredientsLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textColor(.appCinder)
        .numberOfLines(0)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
        addSubviews()
    }
    
    private func configureContents() {
        seperatorView.height(1)
    }
    
    public var title: String? {
        willSet {
            titleLabel.text = newValue
        }
    }
    
    public var icon: UIImage? {
        willSet {
            iconImageView.image = newValue?.resize(to: .init(width: 18, height: 18))
        }
    }
    
    public var iconSubtitle: String? {
        willSet {
            iconImageSubtitleLabel.text = newValue
        }
    }
    
    public var ingredients: String? {
        willSet {
            ingredientsLabel.text = newValue
        }
    }
}

// MARK: - UILayout
extension RecipeDetailIngredientsView {
    
    private func addSubviews() {
        backgroundColor = .appWhite
        addSubview(topContainerView)
        topContainerView.edgesToSuperview(excluding: .bottom)
        topContainerView.height(78)
        
        topContainerView.addSubview(titleLabel)
        titleLabel.leadingToSuperview().constant = 15
        titleLabel.centerYToSuperview()
        
        topContainerView.addSubview(stackView)
        stackView.trailingToSuperview().constant = -15
        stackView.centerYToSuperview()
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(iconImageSubtitleLabel)
        
        addSubview(seperatorView)
        seperatorView.topToBottom(of: topContainerView)
        seperatorView.edgesToSuperview(excluding: [.top, .bottom])
        
        addSubview(ingredientsLabel)
        ingredientsLabel.topToBottom(of: seperatorView)
        ingredientsLabel.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 15, bottom: 10, right: 15))
    }
}
