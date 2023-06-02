//
//  DynamicHeightCollectionView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 1.06.2023.
//

import UIKit

public class DynamicHeightCollectionView: UIView {
    
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
