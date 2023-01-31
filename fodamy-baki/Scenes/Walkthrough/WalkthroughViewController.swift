//
//  WalkthroughViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 31.01.2023.
//

import UIKit

final class WalkthroughViewController: BaseViewController<WalkthroughViewModel> {

    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.horizontal)
        .backgroundColor(.appWhite)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        setLocalize()
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.)
    }
    
    
}

// MARK: - Configure Contents and Localize
extension WalkthroughViewController {
    
    private func configureContents() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
    }
    
    private func setLocalize() {
        
    }
}

// MARK: - UICollectionView Delegate
extension WalkthroughViewController: UICollectionViewDelegate {
    
}

// MARK: - CollectionView Data Source
extension WalkthroughViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.contentView.backgroundColor = .appWhite
        return cell
    }
    
    
}

