//
//  WalkthroughViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 31.01.2023.
//

import UIComponents

final class WalkthroughViewController: BaseViewController<WalkthroughViewModel> {

    private let dissmissButton = UIButtonBuilder()
        .image(UIImage.icClose.withRenderingMode(.alwaysTemplate))
        .tintColor(.appCinder)
        .build()
    
    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.horizontal)
        .backgroundColor(.appWhite)
        .build()
    
    private let pageControl = UIPageControlBuilder<PageControl>()
        .numberOfPages(4)
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
        addDissmissButton()
        addPageControl()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
    }
    
    private func addDissmissButton() {
        view.addSubview(dissmissButton)
        
        dissmissButton.topToSuperview(usingSafeArea: true).constant = 25
        dissmissButton.trailingToSuperview().constant = -20
        dissmissButton.size(.init(width: 18, height: 18))
        
    }
    
    private func addPageControl() {
        view.addSubview(pageControl)
        pageControl.topToBottom(of: collectionView)
        pageControl.centerXToSuperview()
    }
    
    private func addActionButton() {
        view.addSubview(nextActionButton)
        
        nextActionButton.topToBottom(of: pageControl).constant = 20
        nextActionButton.leadingToSuperview().constant = 15
        nextActionButton.trailingToSuperview().constant = -15
        nextActionButton.bottomToSuperview(usingSafeArea: true)
    }
}

// MARK: - Configure Contents and Localize
extension WalkthroughViewController {
    
    private func configureContents() {
        view.backgroundColor = .appWhite
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        collectionView.register(WalkthroughCell.self, forCellWithReuseIdentifier: WalkthroughCell.defaultReuseIdentifier)
        
        nextActionButton.height(60)
        
        nextActionButton.addTarget(self, action: #selector(nextActionButtonTapped), for: .touchUpInside)
        dissmissButton.addTarget(self, action: #selector(dissmissButtonTapped), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(pageControlChanged), for: .touchUpInside)
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

// MARK: - Actions
extension WalkthroughViewController {
    
    @objc
    func dissmissButtonTapped() {
        viewModel.didFinishWalkthrough()
    }
    
    @objc
    func nextActionButtonTapped() {

    }
    
    @objc
    func pageControlChanged(_ sender: UIPageControl) {

    }
}
