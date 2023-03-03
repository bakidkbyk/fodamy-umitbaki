//
//  RecipeCellModel+Extension.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 20.02.2023.
//

extension RecipeCellModel {
    
    convenience init(recipe: Recipe) {
        self.init(recipeId: recipe.id,
                  userId: recipe.user.id,
                  usernameImageUrl: recipe.user.image?.url ?? "",
                  username: recipe.user.username!,
                  recipeAndFollowers: "\(recipe.user.recipeCount) Tarif \(recipe.user.followingCount) Takipçi",
                  recipeTitle: recipe.title!,
                  categoryName: recipe.category.name ?? "",
                  recipeImageUrl: recipe.images?.first?.url ?? "" ,
                  commentAndLikes: "\(recipe.commentCount) Yorum \(recipe.likeCount) Beğeni",
                  isEditorChoice: recipe.isEditorChoice)
    }
}
