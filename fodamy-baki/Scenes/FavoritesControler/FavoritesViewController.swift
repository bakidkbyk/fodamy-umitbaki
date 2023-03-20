//
//  FavoritesViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 7.02.2023.
//

import KeychainSwift

final class FavoritesViewController: BaseViewController<FavoritesViewModel> {
    
    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.vertical)
        .showsHorizontalScrollIndicator(false)
        .showsVerticalScrollIndicator(false)
        .backgroundColor(.appSecondaryBackground)
        .registerCell(FavoritesCell.self, reuseIdentifier: FavoritesCell.defaultReuseIdentifier)
        .build()
    
    private let refreshControl = UIRefreshControl()
    private let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        addNavigationFodamyLogo()
        subscribeViewModel()
        viewModel.fetchCategoryRecipes(isRefreshing: false, isPaging: false)
    }
}

// MARK: UILayout
extension FavoritesViewController {
    
    private func addSubViews() {
        addCollectionView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: true)
    }
}

// MARK: - Configure Contents
extension FavoritesViewController {
    
    private func configureContents() {
        view.backgroundColor = .appWhite
        collectionView.delegate = self
        collectionView.dataSource = self
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .touchUpInside)
    }
    
    private func addNavigationFodamyLogo() {
        let image = UIImage.imgLogoFodamy
        let imageView = UIImageView()
        imageView.size(CGSize(width: 110, height: 30))
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        navigationItem.titleView = imageView
    }
}

// MARK: - Actions
extension FavoritesViewController {
    @objc
    func handleRefreshControl() {
        if refreshControl.isRefreshing {
            viewModel.setDefaults()
            viewModel.fetchCategoryRecipes(isRefreshing: true, isPaging: false)
        }
    }
}

// MARK: - Subscribe View Model
extension FavoritesViewController {
    
    private func subscribeViewModel() {
        
        viewModel.didSuccessFetchRecipes = { [ weak self ] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
        
        viewModel.endRefreshing = { [ weak self ] in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
        }
        
        // Delete Keychain
        viewModel.didSuccessLogout = { [ weak self ] in
            guard let self = self else { return }
            self.keychain.clear()
            self.navigationItem.rightBarButtonItem = .none
        }
    }
}

// MARK: - Scroll view
extension FavoritesViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let contentHeihgt = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if contentOffset > contentHeihgt - height && viewModel.isRequestEnabled && viewModel.isPagingEnabled {
            viewModel.fetchMorePages()
        }
    }
}

// MARK: - Logout
extension FavoritesViewController {
    
    private func setLogoutBarButton() {
        let button = UIBarButtonItem(image: .icLogout, style: .done, target: self, action: #selector(logoutBarButtonTapped))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc
    func logoutBarButtonTapped() {
        viewModel.userLogout()
    }
    
    private func checkUserLogin() {
        guard keychain.get(Keychain.token) != nil else {
            navigationItem.rightBarButtonItem = .none
            return
        }
        setLogoutBarButton()
    }
    // Delete keychain
    private func subscribeViewModelEvents() {
        viewModel.didSuccessLogout = { [ weak self ] in
            guard let self = self else { return }
            self.keychain.delete(Keychain.token)
            self.navigationItem.rightBarButtonItem = .none
        }
    }
}

// MARK: - Collection View Delegate
extension FavoritesViewController: UICollectionViewDelegate { }

// MARK: - Collection View Data Source
extension FavoritesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsAt()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoritesCell = (collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCell.defaultReuseIdentifier,
                                                                      for: indexPath) as? FavoritesCell)!
        
        let cellItem = viewModel.cellItemAt(indexPath)
        cellItem.seeAllButtonClosure = { [ weak self ] id in
            self?.viewModel.seeAllButtonTapped(categoryId: id)
        }
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = view.frame.width
        let cellHeight = CGFloat(270)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
