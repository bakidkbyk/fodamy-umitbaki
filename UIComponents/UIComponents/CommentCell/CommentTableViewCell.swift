//
//  CommentTableViewCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.06.2023.
//

import UIKit

public class CommentTableViewCell: UITableViewCell, ReusableView {
    
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
    
    weak var viewModel: CommentTableViewCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        userView.username = nil
        userView.userImgUrl = nil
        userView.recipeCountAndFollowersLabelText = nil
        timeDifferenceLabel.text = nil
        commentsLabel.text = nil
    }
    
}

// MARK: - UILayout
extension CommentTableViewCell {
    
    private func addSubViews() {
        addSubview(userView)
        userView.isShowsFollowButton = false 
        userView.edgesToSuperview(excluding: [.bottom, .trailing])
        userView.height(70)
        
        addSubview(timeDifferenceLabel)
        timeDifferenceLabel.topToBottom(of: userView)
        timeDifferenceLabel.leadingToSuperview().constant = 15
        timeDifferenceLabel.trailingToSuperview().constant = -15
        
        addSubview(commentsLabel)
        commentsLabel.topToBottom(of: timeDifferenceLabel).constant = 7
        commentsLabel.edgesToSuperview(excluding: .top, insets: UIEdgeInsets(top: 0, left: 15, bottom: 5, right: 15))
    }
}

// MARK: - Set View Model
public extension CommentTableViewCell {
    
    func set(viewModel: CommentTableViewCellProtocol) {
        self.viewModel = viewModel
        userView.username = viewModel.username
        userView.userImgUrl = viewModel.usernameImageUrl
        userView.recipeCountAndFollowersLabelText = viewModel.recipeAndFollowers
        timeDifferenceLabel.text = viewModel.timeDifferenceText
        commentsLabel.text = viewModel.commentText
    }
}
