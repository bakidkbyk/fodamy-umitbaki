//
//  RecipeDetailsViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

import MobilliumBuilders
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
        .axis(.horizontal)
        .spacing(1)
        .distribution(.fillEqually)
        .build()
    
    private let recipeDetailsHeaderView = RecipeDetailHeaderView()
    
    private let recipeDetailsCategoryView = RecipeDetailsCategoryView()
    
    private let countInfoStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(1)
        .distribution(.fillEqually)
        .build()
    
    private let commentCountInfoView = RecipeDetailsCoutInfoView()
    private let likesCountInfoView   = RecipeDetailsCoutInfoView()
    
    private let userView = UserView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appRaven
        addSubviews()
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
        scrollView.addSubview(contentStackView)
        contentStackView.edgesToSuperview()
        contentStackView.widthToSuperview()
        
        contentStackView.addArrangedSubview(recipeDetailsHeaderView)
        recipeDetailsHeaderView.edgesToSuperview()
        recipeDetailsHeaderView.backgroundColor = .appRed
        
    }
    
    private func addCountInfoStackView() {
//        countInfoStackView.addArrangedSubview(commentCountView)
//        countInfoStackView.addArrangedSubview(likesCountView)
    }
}

// MARK: - Configure and Localize
extension RecipeDetailsViewController {
    
    private func configureContents() {
        
    }
    
    private func setLocalize() {
        commentCountInfoView.icon = .icComment
        commentCountInfoView.info = L10n.RecipeDetails.comment
    
    }
    
    private func fillData() {
        navigationItem.title                     = viewModel.recipeName
        recipeDetailsHeaderView.headerImageUrl   = viewModel.recipeHeaderImageUrl
        recipeDetailsCategoryView.recipeTitle    = viewModel.recipeName
        recipeDetailsCategoryView.categoryName   = viewModel.categoryName
        recipeDetailsCategoryView.timeDifference = viewModel.timeDifferenceText
        commentCountInfoView.count               = viewModel.commentCount
        likesCountInfoView.count                 = viewModel.likeCount
    }
}

// MARK: - Actions
