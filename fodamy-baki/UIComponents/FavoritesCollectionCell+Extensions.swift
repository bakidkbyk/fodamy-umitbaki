//
//  FavoritesCollectionCell+Extensions.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 12.03.2023.
//

extension FavoritesCollectionCellModel {
    
    convenience init(recipe: Recipe) {
        
        self.init(recipeId: recipe.id, userImage: recipe.user.image?.url ?? "",
                  username: recipe.user.username,
                  recipeImage: recipe.images?.first?.url,
                  recipeTitle: recipe.title,
                  commentAndLikes: "\(recipe.commentCount) Yorum \(recipe.likeCount) Beğeni")
    }
}
