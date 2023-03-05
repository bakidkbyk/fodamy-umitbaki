//
//  FavoritesCategoryView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 5.03.2023.
//

import UIKit

public class FavoritesCategoryView: UIView {
    
    private let collectionView = UICollectionViewBuilder()
        .isPagingEnabled(true)
        .scrollDirection(.horizontal)
        .backgroundColor(.appWhite)
        .showsHorizontalScrollIndicator(false)
        .build()
    
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
