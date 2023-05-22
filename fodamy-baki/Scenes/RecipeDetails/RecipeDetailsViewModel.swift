//
//  RecipeDetailsViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

import Foundation

protocol RecipeDetailsViewDataSource {
    var username: String? { get }
    var userId: Int? { get }
    var userImageUrl: String? { get }
    var userFollowedCount: Int? { get }
    var recipeName: String? { get }
    var recipeCount: Int? { get }
    var categoryName: String? { get }
    var timeDifferenceText: String? { get }
    var recipeAndFollowerCountText: String? { get }
    
}

protocol RecipeDetailsViewEventSource {}

protocol RecipeDetailsViewProtocol: RecipeDetailsViewDataSource, RecipeDetailsViewEventSource {}

final class RecipeDetailsViewModel: BaseViewModel<RecipeDetailsRouter>, RecipeDetailsViewProtocol {
    
    var username: String?
    var userId: Int?
    var userImageUrl: String?
    var userFollowedCount: Int?
    var recipeName: String?
    var recipeCount: Int?
    var categoryName: String?
    var timeDifferenceText: String?
    var recipeAndFollowerCountText: String?
    
    private let recipeId: Int
    
    init(recipeId: Int, router: RecipeDetailsRouter) {
        self.recipeId = recipeId
        super.init(router: router)
    }
}
