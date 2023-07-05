//
//  CommentCellCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 1.06.2023.
//

public class CommentCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: CommentCellProtocol?
    
    private let userView = UserView()
    
    private let stackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private let differenceLabel = UILabelBuilder()
        .textColor(.appRaven)
        .font(.font(.nunitoSemiBold, size: .large))
        .build()
    private let commentLabel = UILabelBuilder()
        .textColor(.appCinder)
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .numberOfLines(0)
        .build()
    
    private lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContents()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
        configureContents()
    }
    
    public override func systemLayoutSizeFitting(_ targetSize: CGSize,
                                                 withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                                 verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
}
// MARK: - UILayout
extension CommentCell {
    
    private func addSubviews() {
        contentView.addSubview(userView)
        userView.edgesToSuperview(excluding: .bottom)
        
        contentView.addSubview(stackView)
        stackView.topToBottom(of: userView)
        stackView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 20, bottom: 8, right: 20))
        stackView.addArrangedSubview(differenceLabel)
        stackView.addArrangedSubview(commentLabel)
    }
}

// MARK: - SetCellItem
public extension CommentCell {
    
    func set(viewModel: CommentCellProtocol) {
        self.viewModel = viewModel
        userView.username = viewModel.username
        userView.userImgUrl = viewModel.usernameImageUrl
        userView.recipeCountAndFollowersLabelText = viewModel.recipeAndFollowers
        differenceLabel.text = viewModel.timeDifferenceText
        commentLabel.text = viewModel.commentText
    }
}

// MARK: - Configure Contents
extension CommentCell {
    
    private func configureContents() {
        userView.height(65)
        userView.isShowsFollowButton = false
    }
}
