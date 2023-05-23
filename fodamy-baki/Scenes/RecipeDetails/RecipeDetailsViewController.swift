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
    
    private let recipeDetailsCell = RecipeDetailsCell()
    
//    private let topTitleView = RecipeDetailsCategoryView()
//
//    private let countInfoStackView = UIStackViewBuilder()
//        .axis(.horizontal)
//        .spacing(1)
//        .distribution(.fillEqually)
//        .build()
//
//    private let commentCountView = RecipeDetailsCoutInfoView()
//    private let likesCountView = RecipeDetailsCoutInfoView()
//
//    private let userView = UserView()
    
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
        
        contentStackView.addArrangedSubview(recipeDetailsCell)
        
    }
    
    private func addCountInfoStackView() {
//        countInfoStackView.addArrangedSubview(commentCountView)
//        countInfoStackView.addArrangedSubview(likesCountView)
    }
}

// MARK: - Configure Contents
extension RecipeDetailsViewController {
    
    private func configureContents() {
        
    }
    
    private func setLocalize() {
//        commentCountView.icon = .icComment
//        commentCountView.info = L10n.RecipeDetails.comment
    
    }
}

// MARK: - Actions
