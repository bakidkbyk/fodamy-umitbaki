//
//  RecipeDetailHeaderView.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 20.05.2023.
//

import UIKit

final class RecipeDetailHeaderView: UIView {
    
    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.horizontal)
        .backgroundColor(.clear)
        .isPagingEnabled(true)
        .showsHorizontalScrollIndicator(false)
        .registerCell(RecipeHeaderCell.self, reuseIdentifier: "RecipeHeaderCell")
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
    var recipeHeaderData: [RecipeHeaderCellProtocol] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
}

// MARK: - UILayout
extension RecipeDetailHeaderView {
    
    private func addSubviews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addSubview(collectionView)
        collectionView.edgesToSuperview()

    }
}

// MARK: - UICollectionView Delegate
extension RecipeDetailHeaderView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionView DataSource
extension RecipeDetailHeaderView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeHeaderData.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecipeHeaderCell = collectionView.dequeueReusableCell(for: indexPath)
        let currentRecipeHeaderModel = recipeHeaderData[indexPath.row]
        cell.set(viewModel: currentRecipeHeaderModel)
        return cell
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension RecipeDetailHeaderView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
}
