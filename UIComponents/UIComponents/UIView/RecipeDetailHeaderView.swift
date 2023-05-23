//
//  RecipeDetailHeaderView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 23.05.2023.
//

import UIKit

public class RecipeDetailHeaderView: UIView {
    
     let headerImageView = UIImageViewBuilder()
        .backgroundColor(.clear)
        .contentMode(.scaleAspectFill)
        .build()
    
     let editoryPickImageView = UIImageViewBuilder()
        .contentMode(.center)
        .image(UIImage.imgEditorsPick.resize(to: .init(width: 20, height: 24), for: .scaleAspectFit))
        .cornerRadius(20)
        .shadowOpacity(0.40)
        .shadowOffset(.zero)
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
extension RecipeDetailHeaderView {
    
    private func addSubViews() {
        backgroundColor = .appWhite
        
        addSubview(headerImageView)
        headerImageView.edgesToSuperview(excluding: .bottom, insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        headerImageView.size(.init(width: 375, height: 375))
        
        addSubview(editoryPickImageView)
        editoryPickImageView.topToBottom(of: headerImageView).constant = 15
        editoryPickImageView.trailing(to: headerImageView).constant = -15
        editoryPickImageView.size(.init(width: 40, height: 40))
    }
}
