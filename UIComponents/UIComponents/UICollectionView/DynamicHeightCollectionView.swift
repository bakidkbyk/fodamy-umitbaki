//
//  DynamicHeightCollectionView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 1.06.2023.
//

import UIKit

public final class DynamicHeightCollectionView: UICollectionView {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if !(__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize)) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
