//
//  WalkthroughViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 31.01.2023.
//

final class WalkthroughViewController: BaseViewController<WalkthroughViewModel> {

    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.horizontal)
        .backgroundColor(.appWhite)
        .build()
    
    private let dissmissButton = UIButtonBuilder()
        .image(UIImage.icClose.withRenderingMode(.alwaysTemplate))
        .tintColor(.appCinder)
        .build()
    
    private let nextActionButton = ButtonFactory.createPrimaryButton(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        setLocalize()
        addSubViews()
    }
}

// MARK: - UILayout
extension WalkthroughViewController {

    private func addSubViews() {
        addCollectionView()
        addActionButton()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        
        collectionView.backgroundColor = .red
        
    }
    
    private func addActionButton() {
        view.addSubview(nextActionButton)
        
        nextActionButton.topToBottom(of: collectionView).constant = 100
        nextActionButton.leadingToSuperview().constant = 15
        nextActionButton.trailingToSuperview().constant = -15
        nextActionButton.bottomToSuperview(usingSafeArea: true)
    
    }
}

// MARK: - Configure Contents and Localize
extension WalkthroughViewController {
    
    private func configureContents() {
        view.backgroundColor = .gray
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        collectionView.register(WalkthroughCell.self, forCellWithReuseIdentifier: WalkthroughCell.defaultReuseIdentifier)
        nextActionButton.height(60)
    }
    
    private func setLocalize() {
        nextActionButton.setTitle(L10n.Walkthrough.nextActionButtonText, for: .normal)
    }
    
}

// MARK: - UICollectionView Delegate
extension WalkthroughViewController: UICollectionViewDelegate {
    
}

// swiftlint:disable line_length
// MARK: - CollectionView Data Source
extension WalkthroughViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WalkthroughCell = (collectionView.dequeueReusableCell(withReuseIdentifier: WalkthroughCell.defaultReuseIdentifier, for: indexPath) as? WalkthroughCell)!
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WalkthroughViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
}
// swiftlint:enable line_length
