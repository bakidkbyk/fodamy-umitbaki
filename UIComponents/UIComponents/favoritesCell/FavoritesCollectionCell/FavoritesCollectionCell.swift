//
//  FavoritesCollectionCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 5.03.2023.
//

import PaddingLabel

public class FavoritesCollectionCell: UICollectionViewCell, ReusableView {
    
    private let collectionView = UICollectionViewBuilder()
        .isPagingEnabled(true)
        .scrollDirection(.horizontal)
        .backgroundColor(.appWhite)
        .showsHorizontalScrollIndicator(false)
        .registerCell(FavoritesCollectionCell.self, reuseIdentifier: FavoritesCollectionCell.defaultReuseIdentifier)
        .build()
    
    private let recipeImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let userImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .cornerRadius(15)
        .clipsToBounds(true)
        .masksToBounds(true)
        .borderWidth(3)
        .borderColor(UIColor.appRed.cgColor)
        .build()
    
    private let usernameLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.topInset = 5.0
        label.bottomInset = 5.0
        label.leftInset = 7.0
        label.rightInset = 7.0
        label.layer.cornerRadius = 10
        label.clipsToBounds = false
        label.layer.masksToBounds = true
        label.font = .font(.nunitoBold, size: .xSmall)
        label.backgroundColor = .appRed
        label.textColor = .appWhite
        return label
    }()
    
    private let labelContainerView = UIViewBuilder()
        .build()
    
    private let labelContainerStackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private let recipeTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xSmall))
        .textColor(.appCinder)
        .build()
    
    private let likesAndCommentLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xSmall))
        .textColor(.appZircon)
        .build()
    
    var cellItems: [RecipeCellProtocol] = []
    
    func numberOfItemsAt() -> Int {
        let cell = cellItems.count
        return cell
    }
    
    func cellItemAt(_ indexPath: IndexPath) -> RecipeCellProtocol {
        return cellItems[indexPath.row]
    }
    
    var viewModel: RecipeCellProtocol?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
        configureContents()
    }
}

// MARK: UILayout
extension FavoritesCollectionCell {
    
    private func addSubViews() {
        addCollectionViews()
        addRecipeImageView()
        addUserImageView()
        addUsernameLabel()
        addLabelContainerView()
    }
    
    private func addCollectionViews() {
        addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: true)
    }
    
    private func addRecipeImageView() {
        contentView.addSubview(recipeImageView)
        recipeImageView.aspectRatio(1)
        recipeImageView.edgesToSuperview(excluding: .bottom)
    }
    
    private func addUserImageView() {
        contentView.addSubview(userImageView)
        userImageView.top(to: recipeImageView).constant = 5
        userImageView.leading(to: recipeImageView).constant = 5
        userImageView.size(.init(width: 30, height: 30))
    }
    
    private func addUsernameLabel() {
        contentView.addSubview(usernameLabel)
        usernameLabel.leadingToTrailing(of: userImageView).constant = -10
        usernameLabel.centerY(to: userImageView)
        usernameLabel.height(20)
    }
    
    private func addLabelContainerView() {
        contentView.addSubview(labelContainerView)
        labelContainerView.topToBottom(of: recipeImageView)
        labelContainerView.edgesToSuperview(excluding: .top)
        
        labelContainerView.addSubview(labelContainerStackView)
        labelContainerStackView.centerYToSuperview()
        labelContainerStackView.leadingToSuperview().constant = 10
        labelContainerStackView.trailingToSuperview().constant = -10
        labelContainerStackView.addArrangedSubview(recipeTitleLabel)
        labelContainerStackView.addArrangedSubview(likesAndCommentLabel)
    }
}

// MARK: - Configure Contents
extension FavoritesCollectionCell {
    
    private func configureContents() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: CollectionView Delegate
extension FavoritesCollectionCell: UICollectionViewDelegate { }

// MARK: - CollectionView Data Source
extension FavoritesCollectionCell: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfItemsAt()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoritesCollectionCell = (collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCollectionCell.defaultReuseIdentifier,
                                                                                for: indexPath) as? FavoritesCollectionCell)!
        
        let cellItem = cellItemAt(indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FavoritesCollectionCell {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 195)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
// MARK: - Set View Model
public extension FavoritesCollectionCell {
    
    func set(viewModel: RecipeCellProtocol) {
        self.viewModel = viewModel
        self.userImageView.setImageScaled(viewModel.username)
        self.recipeImageView.setImageScaled(viewModel.recipeImageUrl)
        self.usernameLabel.text = viewModel.username
        self.recipeTitleLabel.text = viewModel.recipeTitle
        self.likesAndCommentLabel.text = viewModel.commentAndLikes
    }
}

