//
//  RecipeDetailsViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

import UIComponents
import UIKit

final class RecipeDetailsViewController: BaseViewController<RecipeDetailsViewModel> {
    
    private let scrollView = UIScrollViewBuilder()
        .build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(1)
        .build()
    
    private let imagesHeaderView = RecipeDetailImageView()
    
    private let categoryView = RecipeDetailsCategoryView()
    
    private let seperator = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    
    private let commentAndLikeStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .distribution(.fillProportionally)
        .spacing(1)
        .build()
    
    private let commentCountInfoView = RecipeDetailsCountInfoView()
    private let likesCountInfoView   = RecipeDetailsCountInfoView()
    
    private let userView = UserView()
    
    private let ingredientsView = RecipeDetailIngredientsView()
    
    private let instructionsView = RecipeDetailIngredientsView()
    
    private let commentView = RecipeDetailsCommentView()
    
    private let buttonContainerView = UIView()
    
    private let commentButton = ButtonFactory.createPrimaryButton(style: .large)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
        subscribeViewModel()
        viewModel.getRecipesDetail()
        viewModel.getRecipesDetailsComment()
    }
}

// MARK: - UILayout
extension RecipeDetailsViewController {
    
    private func addSubviews() {
        addContentStackView()
        addCountInfoStackView()
    }
    
    private func addContentStackView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview()
        scrollView.addSubview(contentStackView)
        contentStackView.edgesToSuperview()
        contentStackView.widthToSuperview()
        contentStackView.addArrangedSubview(imagesHeaderView)
        imagesHeaderView.aspectRatio(1)
        contentStackView.addArrangedSubview(categoryView)
        contentStackView.setCustomSpacing(1, after: categoryView)
        contentStackView.addArrangedSubview(seperator)
        contentStackView.addArrangedSubview(commentAndLikeStackView)
        commentAndLikeStackView.addArrangedSubview(commentCountInfoView)
        commentAndLikeStackView.addArrangedSubview(seperator)
        commentAndLikeStackView.addArrangedSubview(likesCountInfoView)
        contentStackView.setCustomSpacing(19, after: commentAndLikeStackView)
        contentStackView.addArrangedSubview(userView)
        userView.height(65)
        contentStackView.setCustomSpacing(20, after: userView)
        contentStackView.addArrangedSubview(ingredientsView)
        contentStackView.setCustomSpacing(20, after: ingredientsView)
        contentStackView.addArrangedSubview(instructionsView)
        contentStackView.setCustomSpacing(20, after: instructionsView)
        contentStackView.addArrangedSubview(commentView)
        contentStackView.setCustomSpacing(20, after: commentView)
        contentStackView.addArrangedSubview(buttonContainerView)
        buttonContainerView.topToBottom(of: commentView).constant = 20
        buttonContainerView.edgesToSuperview(excluding: .top)
        
        buttonContainerView.addSubview(commentButton)
        commentButton.edgesToSuperview(insets: .init(top: 0, left: 20, bottom: 0, right: 20))
        
    }
    
    private func addCountInfoStackView() {
        commentAndLikeStackView.addArrangedSubview(commentCountInfoView)
        commentAndLikeStackView.addArrangedSubview(likesCountInfoView)
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
        instructionsView.title     = L10n.RecipeDetails.recipe
        instructionsView.icon      = .icClock
        commentButton.setTitle(L10n.RecipeDetails.addComment, for: .normal)
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
        instructionsView.iconSubtitle             = viewModel.timeOfRecipe
        instructionsView.ingredients              = viewModel.recipeSteps
    }
}

// MARK: - Subscribe View Model
extension RecipeDetailsViewController {
    
    private func subscribeViewModel() {
        viewModel.reloadDetailData = { [weak self] in
            guard let self = self else { return }
            self.fillData()
        }
        
        viewModel.reloadCommentData = { [weak self] in
            guard let self = self else { return }
            self.commentView.recipeCommentData = self.viewModel.commentsCellItems
        }
    }
}
