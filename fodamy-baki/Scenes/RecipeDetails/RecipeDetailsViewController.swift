//
//  RecipeDetailsViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

import UIComponents

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
    
    private let imagesHeaderView = RecipeDetailImageView()
    
    private let categoryView = RecipeDetailsCategoryView()
    
    private let countInfoStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .distribution(.fillEqually)
        .spacing(1)
        .build()
    
    private let commentCountInfoView = RecipeDetailsCountInfoView()
    private let likesCountInfoView   = RecipeDetailsCountInfoView()
    
    private let userView = UserView()
    
    private let ingredientsView = RecipeDetailIngredientsView()
    
    private let recipeView = RecipeDetailIngredientsView()
    
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
        
        contentStackView.addArrangedSubview(imagesHeaderView)
        contentStackView.setCustomSpacing(0, after: imagesHeaderView)
        contentStackView.addArrangedSubview(categoryView)
        contentStackView.setCustomSpacing(1, after: categoryView)
        contentStackView.addArrangedSubview(countInfoStackView)
        contentStackView.setCustomSpacing(15, after: countInfoStackView)
        contentStackView.addArrangedSubview(userView)
        contentStackView.setCustomSpacing(15, after: userView)
        contentStackView.addArrangedSubview(ingredientsView)
        contentStackView.setCustomSpacing(15, after: ingredientsView)
        contentStackView.addArrangedSubview(recipeView)
        
        imagesHeaderView.aspectRatio(1)
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
        commentCountInfoView.icon  = .icComment
        commentCountInfoView.info  = L10n.RecipeDetails.comment
        likesCountInfoView.icon    = .icHeart.withRenderingMode(.alwaysTemplate)
        likesCountInfoView.info    = L10n.RecipeDetails.likes
        userView.followButtonTitle = L10n.RecipeDetails.follow
        ingredientsView.title      = L10n.RecipeDetails.ingredients
        ingredientsView.icon       = .icRestaurant
        recipeView.title           = L10n.RecipeDetails.recipe
        recipeView.icon            = .icClock
        
    }
    
    private func fillData() {
        navigationItem.title                      = viewModel.recipeName
        imagesHeaderView.recipeImageData          = viewModel.imagesCellItems
        categoryView.recipeTitle                  = viewModel.recipeName
        categoryView.categoryName                 = viewModel.categoryName
        categoryView.timeDifference               = viewModel.timeDifferenceText
        commentCountInfoView.count                = viewModel.commentCount
        likesCountInfoView.count                  = viewModel.likeCount
        userView.username                         = viewModel.username
        userView.recipeCountAndFollowersLabelText = viewModel.recipeAndFollowerCountText
        userView.userImgUrl                       = viewModel.userImageUrl
        userView.isShowsFollowButton              = viewModel.isFollowing
        ingredientsView.iconSubtitle              = viewModel.numberOfPeople
        ingredientsView.ingredients               = viewModel.ingredients
        recipeView.iconSubtitle                   = viewModel.timeOfRecipe
        recipeView.ingredients                    = viewModel.recipeSteps
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
