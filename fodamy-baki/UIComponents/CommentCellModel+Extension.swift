//
//  CommentCell+Extension.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 2.06.2023.
//
import MobilliumUserDefaults

extension CommentCellModel {
    
    convenience init(comment: RecipeComment) {
        let isOwner: Bool
        isOwner = comment.id == DefaultsKey.userId.value
        self.init(userId: comment.user.id,
                  usernameImageUrl: comment.user.image?.url,
                  username: comment.user.username,
                  recipeAndFollowers: "\(comment.user.recipeCount) \(L10n.RecipeDetails.recipe) \(comment.user.followedCount) \(L10n.RecipeDetails.follower)",
                  commentId: comment.id,
                  commentText: comment.text,
                  timeDifferenceText: comment.timeDifference, isOwner: isOwner)
    }
}
