//
//  FavoritesCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.03.2023.
//

public class FavoritesCell: UICollectionViewCell, ReusableView {
    
    private let categoryView = UIImageViewBuilder()
        .backgroundColor(.appWhite)
        .build()
    
    private let categoryImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let categoryTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textColor(.appCinder)
        .build()
    
    private let seeAllButton = UIButtonBuilder()
        .backgroundColor(.appWhite)
        .titleColor(.appRed)
        .titleFont(.font(.nunitoBold, size: .xSmall))
        .title(L10n.Favorites.seeAllButtonText)
        .build()
    
    private let lineView = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    
    private let favoritesCollectionCell = FavoritesCollectionCell()
    
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
}

// MARK: - UILayout
extension FavoritesCell {
    
    private func addSubViews() {
        addCategoryView()
        addLineView()
        addFavoritesCollectionCell()
    }
    
    private func addCategoryView() {
        contentView.addSubview(categoryView)
        categoryView.edgesToSuperview(excluding: .bottom)
        
        categoryView.addSubview(categoryImageView)
        categoryImageView.edgesToSuperview(excluding: .trailing, insets: TinyEdgeInsets(top: 10, left: 15, bottom: 10, right: 0))
        
        categoryView.addSubview(categoryTitleLabel)
        categoryTitleLabel.centerYToSuperview()
        categoryTitleLabel.leadingToTrailing(of: categoryImageView).constant = 5
        
        categoryView.addSubview(seeAllButton)
        seeAllButton.edgesToSuperview(excluding: .leading, insets: TinyEdgeInsets(top: 14, left: 0, bottom: 14, right: 15))
    }
    
    private func addLineView() {
        contentView.addSubview(lineView)
        lineView.edgesToSuperview(excluding: .bottom)
    }
    
    private func addFavoritesCollectionCell() {
        contentView.addSubview(favoritesCollectionCell)
        favoritesCollectionCell.topToBottom(of: lineView)
        favoritesCollectionCell.edgesToSuperview(excluding: .bottom)
    }
    
}
// MARK: - Configure Contents
extension FavoritesCell {
    
    private func configureContents() {
        backgroundColor = .appWhite
        categoryImageView.size(CGSize(width: 24, height: 24))
        lineView.height(1)
        seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension FavoritesCell {
    
    @objc
    func seeAllButtonTapped() {
        
    }
}
