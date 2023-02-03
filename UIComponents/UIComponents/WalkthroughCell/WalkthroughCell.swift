//
//  WalkthroughCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.02.2023.
//

import MobilliumBuilders

public class WalkthroughCell: UICollectionViewCell, ReusableView {
    
    private let imageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let containerView = UIViewBuilder()
        .build()
    
    private let labelStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(10)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xxLarge))
        .textAlignment(.center)
        .textColor(.appCinder)
        .build()
    
    private let descriptionLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textAlignment(.center)
        .textColor(.appRaven)
        .numberOfLines(0)
        .build()
    
    var viewModel: WalkthroughCellProtocol?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
    }
}

// MARK: - UILayout
extension WalkthroughCell {
    
    private func addSubviews() {
        addImageView()
        addContainerView()
        contentView.backgroundColor = .appWhite
    }
    
    private func addImageView() {
        contentView.addSubview(imageView)
        imageView.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50))
        imageView.centerYToSuperview()
        imageView.aspectRatio(1)
    }
    
    private func addContainerView() {
        contentView.addSubview(containerView)
        containerView.topToBottom(of: imageView)
        containerView.edgesToSuperview(excluding: .top)
        
        containerView.addSubview(labelStackView)
        
        labelStackView.centerYToSuperview()
        labelStackView.leadingToSuperview().constant = 50
        labelStackView.trailingToSuperview().constant = -50
        
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(descriptionLabel)
        
    }
}

// MARK: - SetViewModel
extension WalkthroughCell {

    public func set(viewModel: WalkthroughCellProtocol) {
        self.viewModel = viewModel
        self.imageView.image = viewModel.image
        self.titleLabel.text = viewModel.titleLabel
        self.descriptionLabel.text = viewModel.descriptionLabel
    }
}
