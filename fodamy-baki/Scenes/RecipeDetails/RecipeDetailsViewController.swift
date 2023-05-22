//
//  RecipeDetailsViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

import MobilliumBuilders
import UIComponents
import Security

final class RecipeDetailsViewController: BaseViewController<RecipeDetailsViewModel> {
    
    private let recipeHeaderView = RecipeDetailHeaderView()
    
    private let scrollView = UIScrollViewBuilder()
        .showsHorizontalScrollIndicator(false)
        .showsVerticalScrollIndicator(false)
        .alwaysBounceVertical(false)
        .build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(1)
        .distribution(.fillEqually)
        .build()
    
    private let topTitleView = RecipeDetailsCategoryView()
    
    private let countInfoStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(1)
        .distribution(.fillEqually)
        .build()
    
    private let commentCountView = CoutInfoView()
    private let likesCountView = CoutInfoView()
    
    private let userView = UserView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appRaven
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
        
        contentStackView.addArrangedSubview(recipeHeaderView)
        contentStackView.setCustomSpacing(0, after: recipeHeaderView)
        contentStackView.addArrangedSubview(topTitleView)
        contentStackView.setCustomSpacing(1, after: topTitleView)
        contentStackView.addArrangedSubview(countInfoStackView)
        contentStackView.addArrangedSubview(userView)
    }
    
    private func addCountInfoStackView() {
        countInfoStackView.addArrangedSubview(commentCountView)
        countInfoStackView.addArrangedSubview(likesCountView)
    }
}

// MARK: - Configure Contents
extension RecipeDetailsViewController {
    
    private func configureContents() {
        
    }
    
    private func setLocalize() {
        commentCountView.icon = .icComment
        commentCountView.
    }
}

// MARK: - Actions
