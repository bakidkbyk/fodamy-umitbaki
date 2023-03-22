//
//  RecipesViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 13.02.2023.
//

import CoreImage

final class RecipesViewController: BaseViewController<RecipesViewModel> {
    
    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.vertical)
        .backgroundColor(.appSecondaryBackground)
        .showsVerticalScrollIndicator(false)
        .showsHorizontalScrollIndicator(false)
        .isPagingEnabled(true)
        .build()
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        subscribeViewModel()
        viewModel.fetchRecipeListing(isRefreshing: false, isPaging: false)
    }
}

// MARK: - UILayout
extension RecipesViewController {
    
    private func addSubViews() {
        addCollectionView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview()
    }
}

// MARK: - Configure Contents
extension RecipesViewController {
    
    private func configureContents() {
        navigationItem.title = viewModel.title
        collectionView.register(RecipeCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
}

// MARK: - Actions
extension RecipesViewController {
    
    @objc
    func handleRefreshControl() {
        if refreshControl.isRefreshing {
            viewModel.setDefaults()
            viewModel.fetchRecipeListing(isRefreshing: true, isPaging: false)
        }
    }
}

// MARK: - Subscribe View Model
extension RecipesViewController {
    
    private func subscribeViewModel() {
        viewModel.didSuccessFetchRecipes = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
        
        viewModel.endRefreshing = { [weak self] in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
        }
    }
}

// MARK: - UIScrollView
extension RecipesViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if contentOffsetY > contentHeight - height && viewModel.isPagingEnabled
            && viewModel.isRequestEnabled {
            viewModel.fetchMorePages()
        }
    }
}

// MARK: - UICollection View Delegate
extension RecipesViewController: UICollectionViewDelegate {}

// MARK: - UICollection View Data Source
extension RecipesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsAt()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecipeCell = collectionView.dequeueReusableCell(for: indexPath)
        
        let cellItem = viewModel.cellItemAt(indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RecipesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionCellWidth = view.frame.width
        let foodImagaHeight = collectionCellWidth - 35
        let cellItemsHeight = CGFloat(180)
        let collectionCellHeight = foodImagaHeight + cellItemsHeight
        return CGSize(width: collectionCellWidth, height: collectionCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
