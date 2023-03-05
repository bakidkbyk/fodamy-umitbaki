//
//  FavoritesCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.03.2023.
//

public class FavoritesCell: UICollectionViewCell, ReusableView {
    
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
    
    
}
