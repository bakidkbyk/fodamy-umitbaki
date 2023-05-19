//
//  RecipeDetailsCategoryView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

public class RecipeDetailsCategoryView: UIView {
    
    private let categoryStackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private let recipeTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appCinder)
        .build()
    
    private let categoryNameLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appRaven)
        .build()
    
    private let differenceLabel = UILabelBuilder()
        .textColor(.appRaven)
        .font(.font(.nunitoBold, size: .medium))
        .textAlignment(.right)
        .build()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    public var recipeTitle: String? {
        willSet {
            recipeTitleLabel.text = newValue
        }
    }
    
    public var categoryName: String? {
        willSet {
            categoryNameLabel.text = newValue
        }
    }
    
    public var timeDifference: String? {
        willSet {
            differenceLabel.text = newValue
        }
    }
}

// MARK: - UILayout
extension RecipeDetailsCategoryView {
    
    private func addSubViews() {
        backgroundColor = .appWhite
        addSubview(categoryStackView)
        categoryStackView.edgesToSuperview(insets: .init(top: 11, left: 15, bottom: 11, right: 0))
        
        categoryStackView.addArrangedSubview(recipeTitleLabel)
        categoryStackView.addArrangedSubview(categoryNameLabel)
        
        addSubview(differenceLabel)
        differenceLabel.leadingToTrailing(of: categoryStackView).constant = 10
        differenceLabel.trailingToSuperview().constant = -15
        differenceLabel.centerYToSuperview()
    }
}
