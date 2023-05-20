//
//  RecipeHeaderCellCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 20.05.2023.
//

import UIKit

public class RecipeHeaderCellCell: UICollectionViewCell, ReusableView {
    
    private let headerImageView = UIImageViewBuilder()
        .backgroundColor(.clear)
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
        .build()
    
    private let editoryPickImageView = UIImageViewBuilder()
        .contentMode(.center)
        .image(UIImage.imgEditorsPick.resize(to: .init(width: 20, height: 24), for: .scaleAspectFit))
        .cornerRadius(20)
        .shadowColor(UIColor.appCinder.cgColor)
        .shadowOpacity(0.40)
        .shadowOffset(.zero)
        .shadowRadius(4)
        .backgroundColor(.appWhite)
        .build()
    
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
extension RecipeHeaderCellCell {
    
    private func addSubViews() {
        contentView.addSubview(headerImageView)
        headerImageView.edgesToSuperview()
        
        contentView.addSubview(editoryPickImageView)
        editoryPickImageView.topToBottom(of: headerImageView).constant = 15
        editoryPickImageView.trailing(to: headerImageView).constant = -15
        editoryPickImageView.size(.init(width: 40, height: 40))
    }
}

// MARK: - Set ViewModel
public extension RecipeHeaderCellCell {
    
    func set(viewModel: RecipeHeaderCellCellProtocol) {
        headerImageView.setImage(viewModel.imgUrl)
        editoryPickImageView.isHidden = !viewModel.isEditorChoice
    }
}
