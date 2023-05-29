//
//  RecipeDetailImageView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 27.05.2023.
//

import UIKit

public class RecipeDetailImageView: UIView {
    
    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.horizontal)
        .allowsMultipleSelection(true)
        .isPagingEnabled(true)
        .backgroundColor(.clear)
        .registerCell(RecipeHeaderCell.self, reuseIdentifier: "RecipeHeaderCell")
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    public var recipeImageData: [RecipeHeaderCellProtocol] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
}

// MARK: - UILayout
extension RecipeDetailImageView {
    
    private func addSubViews() {
        backgroundColor = .appWhite
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addSubview(collectionView)
        collectionView.edgesToSuperview()
    }
}

// MARK: - UICollectionView Delegate
extension RecipeDetailImageView: UICollectionViewDelegate {
    
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
