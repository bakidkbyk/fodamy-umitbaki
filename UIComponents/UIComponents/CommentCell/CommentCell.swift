//
//  CommentCellCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 1.06.2023.
//

import UIKit

public class CommentCellCell: UICollectionViewCell, ReusableView {
    
    private let userView = UserView()
    
    private let timeDifferenceLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xSmall))
        .textColor(.appRaven)
        .build()
    
    private let commentsLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appCinder)
        .numberOfLines(0)
        .build()
    
    
    weak var viewModel: CommentCellCellProtocol?
    
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
    
    public func set(viewModel: CommentCellCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
