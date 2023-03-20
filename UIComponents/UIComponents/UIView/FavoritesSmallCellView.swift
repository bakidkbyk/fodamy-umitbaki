//
//  FavoritesSmallCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 17.03.2023.
//

public class FavoritesSmallCellView: UIView {
    
    private let collectionView = UICollectionViewBuilder()
        .isPagingEnabled(true)
        .scrollDirection(.horizontal)
        .backgroundColor(.appWhite)
        .showsHorizontalScrollIndicator(false)
        .registerCell(FavoritesCollectionCell.self, reuseIdentifier: FavoritesCollectionCell.defaultReuseIdentifier)
        .build()
    
    var cellItems: [FavoritesCollectionCellProtocol] = []
    
    func numberOfItemsAt() -> Int {
        let cell = cellItems.count
        return cell
    }
    
    func cellItemAt(_ indexPath: IndexPath) -> FavoritesCollectionCellProtocol {
        return cellItems[indexPath.row]
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContents()
        
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
}

// MARK: - UILayout
extension FavoritesSmallCellView {
    
    private func addSubviews() {
        addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: true)
    }
}

// MARK: - Configure Contents
extension FavoritesSmallCellView {
    
    private func configureContents() {
        collectionView.backgroundColor = .appWhite
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: CollectionView Delegate
extension FavoritesSmallCellView: UICollectionViewDelegate { }

// MARK: - CollectionView Data Source
extension FavoritesSmallCellView: UICollectionViewDataSource {
    
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
extension FavoritesSmallCellView: UICollectionViewDelegateFlowLayout {
    
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
