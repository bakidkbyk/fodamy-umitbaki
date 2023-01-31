//
//  CustomCollectionViewCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 31.01.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    private let identifier = "CustomCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
