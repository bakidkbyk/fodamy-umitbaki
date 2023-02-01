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
        
        collectionView.edgesToSuperview(excluding: .bottom, insets: .init(top: 100, left: 50, bottom: 0, right: 50), usingSafeArea: true)
        
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
        
    }
    
    private func addActionButton() {
        view.addSubview(nextActionButton)
        
        nextActionButton.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 15, bottom: 5, right: 15), usingSafeArea: true)
    }
}

// MARK: - Configure Contents and Localize
extension WalkthroughViewController {
    
    private func configureContents() {
        view.backgroundColor = .gray
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        
        nextActionButton.height(60)
    }
    
    private func setLocalize() {
        nextActionButton.setTitle(L10n.Walkthrough.nextActionButtonText, for: .normal)
    }
    
}

// MARK: - UICollectionView Delegate
extension WalkthroughViewController: UICollectionViewDelegate {
    
}

// MARK: - CollectionView Data Source
extension WalkthroughViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell)!
        return cell 
    }
}

