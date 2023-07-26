//
//  RecipeDetailImageView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 27.05.2023.
//

import UIKit
import SKPhotoBrowser

public class RecipeDetailImageView: UIView, SKPhotoBrowserDelegate {
    
    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.horizontal)
        .allowsMultipleSelection(true)
        .isPagingEnabled(true)
        .backgroundColor(.clear)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
        matchPhotoBrowserDelegate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        configureContents()
        matchPhotoBrowserDelegate()
    }
    
    public var recipeImageData: [RecipeHeaderCellProtocol] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var photoBrowserDelegate = PhotoBrowserDelegate()
    public var skPhotoBrowser: SkPhotoBrowserClosure?
    var currentPageIndex: Int = 0
    var initPageIndex: Int = 0
}

// MARK: - UILayout
extension RecipeDetailImageView {
    
    private func addSubViews() {
        backgroundColor = .appWhite
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RecipeHeaderCell.self)
        
        addSubview(collectionView)
        collectionView.edgesToSuperview()
    }
}

// MARK: - Configure Contents
extension RecipeDetailImageView {
    
    private func configureContents() {
        SKPhotoBrowserOptions.displayAction = false
        SKPhotoBrowserOptions.displayHorizontalScrollIndicator = false
        SKPhotoBrowserOptions.displayVerticalScrollIndicator = false
    }
}

// MARK: - Actions
extension RecipeDetailImageView {
    
    private func matchPhotoBrowserDelegate() {
        photoBrowserDelegate.showPhotoIndex = { [weak self] index in
            guard let self = self else { return }
            let indexPath = IndexPath(item: index, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    func callSKPhotoBrowser(photos: [String], initialPageIndex: Int) -> SKPhotoBrowser {
        let skPhotos = photos.map { SKPhoto.photoWithImageURL($0) }
        let skBrowser = SKPhotoBrowser(photos: skPhotos, initialPageIndex: initialPageIndex)
        self.currentPageIndex = min(initialPageIndex, photos.count - 1)
        self.initPageIndex = self.currentPageIndex
        skBrowser.delegate = self
        return skBrowser
    }
}

// MARK: - UICollectionView Delegate
extension RecipeDetailImageView: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photos = recipeImageData.map { $0.imageUrl }
        self.skPhotoBrowser?(callSKPhotoBrowser(photos: photos, initialPageIndex: indexPath.row))
    }
}

// MARK: - UICollectionView DataSource
extension RecipeDetailImageView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recipeImageData.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecipeHeaderCell = collectionView.dequeueReusableCell(for: indexPath)
        let recipeCellModel = recipeImageData[indexPath.row]
        cell.set(viewModel: recipeCellModel)
        return cell
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension RecipeDetailImageView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
