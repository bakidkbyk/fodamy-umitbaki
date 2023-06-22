//
//  CommentListViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 9.06.2023.
//

final class CommentListViewController: BaseViewController<CommentListViewModel> {
    
    private let collectionView = UICollectionViewBuilder()
        .backgroundColor(.appWhite)
        .scrollDirection(.vertical)
        .estimatedItemSize(UICollectionViewFlowLayout.automaticSize)
        .build()
    
    private let commentInputView = CommentInputView()
    private var bottomViewBottomConstraint: NSLayoutConstraint?
    private let refreshControl = UIRefreshControl()
    
    private var keyboardWillShowObserver: NSObjectProtocol?
    private var keyboardWillHideObserver: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
        subscribeViewModel()
        addKeyboardObservers()
        viewModel.getRecipeCommentList(isRefreshing: false, isPaging: false)
    }
}

// MARK: - UILayout
extension CommentListViewController {
    
    private func addSubviews() {
        addCollectionView()
        addCommentInputView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
    }
    
    private func addCommentInputView() {
        view.addSubview(commentInputView)
        commentInputView.topToBottom(of: collectionView)
        commentInputView.edgesToSuperview(excluding: [.top, .bottom])
        bottomViewBottomConstraint = commentInputView.bottomToSuperview(usingSafeArea: true)
    }
}

// MARK: - Configure Contents
extension CommentListViewController {
    
    private func configureContents() {
        view.backgroundColor = .appWhite
        collectionView.register(CommentCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        bottomViewBottomConstraint?.isActive = true        
    }
    
    private func setLocalize() {
        navigationItem.title = L10n.CommentList.comments
    }
}

// MARK: - Actions
extension CommentListViewController {
    
    @objc
    func handleRefreshControl() {
        if refreshControl.isRefreshing {
            viewModel.getRecipeCommentList(isRefreshing: true, isPaging: false)
        }
    }
}

// MARK: - Subscribe View Model
extension CommentListViewController {
    
    func subscribeViewModel() {
        viewModel.didSuccessListComments = { [weak self] in
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
extension CommentListViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if contentOffsetY > contentHeight - height && viewModel.isPagingEnabled
            && viewModel.isRequestEnabled {
            viewModel.getRecipeCommentList(isRefreshing: false, isPaging: true)
        }
    }
}

// MARK: - UICollectionView Delegate
extension CommentListViewController: UICollectionViewDelegate { }

// MARK: - UICollectionView DataSource
extension CommentListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CommentCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemsAt(indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension CommentListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let XLMargin: CGFloat = 40
        let cellWidth = collectionView.bounds.width - XLMargin
        return CGSize(width: cellWidth, height: 10)
    }
}

// MARK: - Keyboard Observer
extension CommentListViewController {
    
    private func addKeyboardObservers() {
            keyboardWillShowObserver = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] notification in
                self?.keyboardWillShow(notification)
            }
            
            keyboardWillHideObserver = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { [weak self] notification in
                self?.keyboardWillHide(notification)
            }
        }
    
    private func keyboardWillShow(_ notification: Notification) {
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                let keyboardHeight = keyboardFrame.height
                self.bottomViewBottomConstraint?.constant = self.view.safeAreaInsets.bottom - keyboardHeight
                self.view.layoutIfNeeded()
            }
        }
    
    private func keyboardWillHide(_ notification: Notification) {
        self.bottomViewBottomConstraint?.constant = 0
        self.view.layoutIfNeeded()
     }
    
    private func removeKeyboardObservers() {
          if let willShowObserver = keyboardWillShowObserver {
              NotificationCenter.default.removeObserver(willShowObserver)
          }
          
          if let willHideObserver = keyboardWillHideObserver {
              NotificationCenter.default.removeObserver(willHideObserver)
          }
      }
}
