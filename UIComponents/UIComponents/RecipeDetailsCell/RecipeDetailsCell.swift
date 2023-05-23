//
//  RecipeDetailsCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 23.05.2023.
//

import UIKit

public class RecipeDetailsCell: UICollectionViewCell, ReusableView {
    
    let recipeDetailsHeaderView = RecipeDetailHeaderView()
    
    
    weak var viewModel: RecipeDetailsCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
}

// MARK: - Set ViewModel
public extension RecipeDetailsCell {
    func set(viewModel: RecipeDetailsCellProtocol) {
        self.viewModel = viewModel
        recipeDetailsHeaderView.headerImageView.setImage(viewModel.imgUrl)
        recipeDetailsHeaderView.editoryPickImageView.isHidden = !viewModel.isEditorChoice
    }
}
