//
//  RecipeDetailsCommentView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 2.06.2023.
//

public class RecipeDetailsCommentView: UIView {
    
    private let topContainerView = UIView()
    
    private let titleLabel = UILabelBuilder()
        .textColor(.appCinder)
        .font(.font(.nunitoBold, size: .xLarge))
        .build()
    
    private let seperator = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    
    private let collectionView = UICollectionViewBuilder<DynamicHeightCollectionView>()
        .backgroundColor(.appWhite)
        .scrollDirection(.vertical)
        .estimatedItemSize(UICollectionViewFlowLayout.automaticSize)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
        setLocalize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        configureContents()
        setLocalize()
    }
    
    public var recipeCommentData: [CommentCellProtocol] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
}

// MARK: - UILayout
extension RecipeDetailsCommentView {
    
    private func addSubViews() {
        backgroundColor = .appWhite
        
        addSubview(topContainerView)
        topContainerView.edgesToSuperview(excluding: .bottom, insets: .init(top: 12, left: 20, bottom: 0, right: 20))
        topContainerView.height(46)
        topContainerView.addSubview(titleLabel)
        titleLabel.edgesToSuperview()
        
        addSubview(seperator)
        seperator.topToBottom(of: topContainerView).constant = 12
        seperator.edgesToSuperview(excluding: [.top, .bottom])
        
        addSubview(collectionView)
        collectionView.topToBottom(of: seperator)
        collectionView.edgesToSuperview(excluding: .top)
    }
}

// MARK: - Configure Contents
extension RecipeDetailsCommentView {
    
    private func configureContents() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CommentCell.self)
        
        topContainerView.height(45)
        seperator.height(1)
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.RecipeDetails.commentTitle
    }
}

// MARK: - UICollectionViewDataSource
extension RecipeDetailsCommentView: UICollectionViewDataSource {
   
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return recipeCommentData.count
  }
   
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: CommentCell = collectionView.dequeueReusableCell(for: indexPath)
    let cellItem = recipeCommentData[indexPath.row]
    cell.set(viewModel: cellItem)
    return cell
  }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension RecipeDetailsCommentView: UICollectionViewDelegateFlowLayout {
   
  public func collectionView(_ collectionView: UICollectionView,
                layout collectionViewLayout: UICollectionViewLayout,
                sizeForItemAt indexPath: IndexPath) -> CGSize {
    let XLMargin: CGFloat = 40
    let cellWidth = collectionView.bounds.width - XLMargin
          return CGSize(width: cellWidth, height: 10)
  }
   
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
}
