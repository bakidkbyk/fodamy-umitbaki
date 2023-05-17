//
//  CommentAndLikesView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 4.04.2023.
//

public class CommentAndLikesView: UIView {
    
    private let commentAndLikesStakView = UIStackViewBuilder()
        .axis(.horizontal)
        .build()
    
    private let commentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private let commentImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let commentLabel = UILabelBuilder()
        .textColor(.appZircon)
        .textAlignment(.center)
        .build()
    
    private let likesStakView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private let likesImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let likesLabel = UILabelBuilder()
        .textColor(.appZircon)
        .textAlignment(.center)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
        addSubViews()
    }
    
    private func configureContents() {
        commentLabel.height(18)
        likesLabel.height(18)
    }
}

// MARK: - UILayouts
extension CommentAndLikesView {
    
    private func addSubViews() {
        addSubview(commentAndLikesStakView)
        commentAndLikesStakView.edgesToSuperview()
        commentAndLikesStakView.addArrangedSubview(commentStackView)
        commentAndLikesStakView.addArrangedSubview(likesStakView)
        
        commentStackView.centerInSuperview()
        commentStackView.addArrangedSubview(commentImageView)
        commentStackView.addArrangedSubview(commentLabel)
        
        likesStakView.centerInSuperview()
        likesStakView.addArrangedSubview(likesImageView)
        likesStakView.addArrangedSubview(likesLabel)
    }
}
