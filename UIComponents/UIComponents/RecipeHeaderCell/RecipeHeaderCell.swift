//
//  RecipeDetailsCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 27.05.2023.
//

import UIKit

public class RecipeHeaderCell: UICollectionViewCell, ReusableView {
    
    private let recipeImageView = UIImageViewBuilder()
        .backgroundColor(.clear)
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
        .build()

    private let editoryPickImageView = UIImageViewBuilder()
        .backgroundColor(.appWhite)
        .image(UIImage.imgEditorsPick.resize(to: .init(width: 20, height: 24), for: .scaleAspectFit))
        .cornerRadius(20)
        .shadowColor(UIColor.appCinder.cgColor)
        .build()
    
    weak var viewModel: RecipeHeaderCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}

// MARK: - UILayout
extension RecipeHeaderCell {
    
    private func addSubViews() {
        contentView.addSubview(recipeImageView)
        recipeImageView.edgesToSuperview()
        
        contentView.addSubview(editoryPickImageView)
        editoryPickImageView.topToBottom(of: recipeImageView).constant = 15
        editoryPickImageView.trailing(to: recipeImageView).constant = -15
        editoryPickImageView.size(.init(width: 40, height: 40))
    }
}

// MARK: - Set ViewModel
public extension RecipeHeaderCell {
    
    func set(viewModel: RecipeHeaderCellProtocol) {
        recipeImageView.setImage(viewModel.imageUrl)
        editoryPickImageView.isHidden = !viewModel.isEditorChoice
    }
}
