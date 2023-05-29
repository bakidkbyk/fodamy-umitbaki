//
//  RecipeDetailsViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

final class RecipeDetailsViewController: BaseViewController<RecipeDetailsViewModel> {
    
    private let scrollView = UIScrollViewBuilder()
        .showsHorizontalScrollIndicator(false)
        .showsVerticalScrollIndicator(false)
        .alwaysBounceVertical(false)
        .build()
    
    private let contentView = UIButtonBuilder()
        .build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(1)
        .build()
    
    private let recipeDetailsHeaderView = RecipeDetailImageView()
    
    private let recipeDetailsCategoryView = RecipeDetailsCategoryView()
    
    private let countInfoStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .distribution(.fillEqually)
        .spacing(1)
        .build()
    
    private let commentCountInfoView = RecipeDetailsCoutInfoView()
    private let likesCountInfoView   = RecipeDetailsCoutInfoView()
    
    private let userView = UserView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
        subscribeViewModel()
        viewModel.getRecipesDetail()
    }
}

// MARK: - UILayout
extension RecipeDetailsViewController {
    
    private func addSubviews() {
        addScrollView()
        addContentStackView()
        addCountInfoStackView()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(excluding: .top)
        scrollView.topToSuperview(usingSafeArea: true)
    }
    
    private func addContentStackView() {
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview()
        
        contentStackView.addArrangedSubview(recipeDetailsHeaderView)
        contentStackView.setCustomSpacing(0, after: recipeDetailsHeaderView)
        contentStackView.addArrangedSubview(recipeDetailsCategoryView)
        contentStackView.setCustomSpacing(1, after: recipeDetailsCategoryView)
        contentStackView.addArrangedSubview(countInfoStackView)
        contentStackView.setCustomSpacing(15, after: countInfoStackView)
        contentStackView.addArrangedSubview(userView)
        
        recipeDetailsHeaderView.aspectRatio(1)
    }
    
    private func addCountInfoStackView() {
        countInfoStackView.addArrangedSubview(commentCountInfoView)
        countInfoStackView.addArrangedSubview(likesCountInfoView)
    }
}

// MARK: - Configure and Localize
extension RecipeDetailsViewController {
    
    private func configureContents() {
        view.backgroundColor = .appZircon
    }
    
    private func setLocalize() {
        commentCountInfoView.icon = .icComment
        commentCountInfoView.info = L10n.RecipeDetails.comment
        likesCountInfoView.icon   = .icHeart.withRenderingMode(.alwaysTemplate)
        likesCountInfoView.info   = L10n.RecipeDetails.likes
        userView.followButton.setTitle(L10n.RecipeDetails.follow, for: .normal)
    }
    
    private func fillData() {
        navigationItem.title                      = viewModel.recipeName
        recipeDetailsHeaderView.recipeImageData   = viewModel.recipeHeaderCellItems
        recipeDetailsCategoryView.recipeTitle     = viewModel.recipeName
        recipeDetailsCategoryView.categoryName    = viewModel.categoryName
        recipeDetailsCategoryView.timeDifference  = viewModel.timeDifferenceText
        commentCountInfoView.count                = viewModel.commentCount
        likesCountInfoView.count                  = viewModel.likeCount
        userView.username                         = viewModel.username
        userView.recipeCountAndFollowersLabelText = viewModel.recipeAndFollowerCountText
        userView.userImgUrl                       = viewModel.userImageUrl
        userView.isShowsFollowButton              = viewModel.isFollowing
    }
}

// MARK: - Subscribe View Model
extension RecipeDetailsViewController {
    
    private func subscribeViewModel() {
        viewModel.reloadDetailData = { [weak self] in
            guard let self = self else { return }
            self.fillData()
        }
    }
}
