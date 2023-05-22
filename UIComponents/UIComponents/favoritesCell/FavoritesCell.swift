//
//  FavoritesCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.03.2023.
//


public class FavoritesCell: UICollectionViewCell, ReusableView {
    
    private let categoryView = UIViewBuilder()
        .backgroundColor(.appWhite)
        .build()
    
    private let categoryImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let categoryTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textColor(.appCinder)
        .build()
    
    private let seeAllButton = UIButtonBuilder()
        .backgroundColor(.clear)
        .titleColor(.appRed)
        .titleFont(.font(.nunitoBold, size: .xSmall))
        .title(L10n.Favorites.seeAllButtonText)
        .build()
    
    private let lineView = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    
    private let collectionView = UICollectionViewBuilder()
        .isPagingEnabled(true)
        .scrollDirection(.horizontal)
        .backgroundColor(.appWhite)
        .showsHorizontalScrollIndicator(false)
        .build()
    
    weak var viewModel: FavoritesCellProtocol?
    var didSelectRecipe: IntClosure?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
        subscribeEventsModel()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
        configureContents()
        subscribeEventsModel()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        categoryImageView.image = nil
        categoryTitleLabel.text = nil
    }
}

// MARK: - UILayout
extension FavoritesCell {
    
    private func addSubViews() {
        addCategoryView()
        addLineView()
        addCollectionView()
        bringSubviewToFront(seeAllButton)
    }
    
    private func addCategoryView() {
        contentView.addSubview(categoryView)
        categoryView.edgesToSuperview(excluding: .bottom)
        
        categoryView.addSubview(categoryImageView)
        categoryImageView.edgesToSuperview(excluding: .trailing, insets:
                .init(top: 10, left: 15, bottom: 10, right: 0))
        
        categoryView.addSubview(categoryTitleLabel)
        categoryTitleLabel.centerYToSuperview()
        categoryTitleLabel.leadingToTrailing(of: categoryImageView).constant = 5
        
        categoryView.addSubview(seeAllButton)
        seeAllButton.trailingToSuperview().constant = -15
        seeAllButton.leadingToTrailing(of: categoryTitleLabel).constant = 15
        seeAllButton.centerYToSuperview()
        // hugging compression
        seeAllButton.setHugging(.required, for: .horizontal)
    }
    
    private func addLineView() {
        contentView.addSubview(lineView)
        lineView.topToBottom(of: categoryView)
        lineView.leadingToSuperview()
        lineView.trailingToSuperview()
    }
    
    private func addCollectionView() {
        contentView.addSubview(collectionView)
        collectionView.topToBottom(of: lineView)
        collectionView.edgesToSuperview(excluding: .top)
    }
    
}
// MARK: - Configure Contents
extension FavoritesCell {
    
    private func configureContents() {
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(FavoritesCollectionCell.self)
        backgroundColor = .appZircon
        categoryView.height(44)
        categoryImageView.size(CGSize(width: 24, height: 24))
        lineView.size(CGSize(width: 1, height: 1))
        seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        categoryTitleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(seeAllButtonTapped)))
    }
}

// MARK: - Actions
extension FavoritesCell {
    
    @objc
    func seeAllButtonTapped() {
        guard let categoryId = viewModel?.categoryId, let categoryName = viewModel?.categoryName else { return }
        viewModel?.seeAllButtonClosure?(categoryId, categoryName)
    }
}

// MARK: - Set View Model
public extension FavoritesCell {
    
    func set(viewModel: FavoritesCellProtocol) {
        self.viewModel = viewModel
        self.categoryImageView.setImage(viewModel.categoryImage)
        self.categoryTitleLabel.text = viewModel.categoryName
        self.didSelectRecipe = viewModel.didSelectRecipe
        
    }
}

// MARK: Subscribe
extension FavoritesCell {
    private func subscribeEventsModel() {
        viewModel?.reloadData = { [ weak self ] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}

// MARK: CollectionView Delegate
extension FavoritesCell: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.didSelectRecipe(indexPath: indexPath)
    }
}

// MARK: - CollectionView Data Source
extension FavoritesCell: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItemsAt() ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoritesCollectionCell = collectionView.dequeueReusableCell(for: indexPath)
        if let cellItem = viewModel?.cellItems[indexPath.row] {
            cell.set(viewModel: cellItem)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FavoritesCell: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 195)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
