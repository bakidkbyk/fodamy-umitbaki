//
//  RecipeDetailsCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 23.05.2023.
//

import UIKit

public class RecipeDetailsCell: UICollectionViewCell, ReusableView {
    
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
    
    public func set(viewModel: RecipeDetailsCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
