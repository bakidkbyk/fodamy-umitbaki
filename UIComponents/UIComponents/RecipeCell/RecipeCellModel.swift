//
//  RecipeCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 13.02.2023.
//

public protocol RecipeCellDataSource {
    var recipeId: Int { get }
    var userId: Int { get }
    var usernameImageUrl: String? { get }
    var username: String? { get }
    var recipeAndFollowers: String? { get }
    var recipeTitle: String? { get }
    var categoryName: String? { get }
    var foodImageUrl: String? { get }
    var commentAndLikes: String? { get }
    var isEditorChoice: Bool { get }
}
public protocol RecipeCellEventSource { }

public protocol RecipeCellProtocol : RecipeCellDataSource, RecipeCellEventSource { }

public class RecipeCellModel: RecipeCellProtocol {
    
    public var recipeId: Int
    public var userId: Int
    public var usernameImageUrl: String?
    public var username: String?
    public var recipeAndFollowers: String?
    public var recipeTitle: String?
    public var categoryName: String?
    public var foodImageUrl: String?
    public var commentAndLikes: String?
    public var isEditorChoice = false
 
    public init(recipeId: Int,
                userId: Int,
                usernameImageUrl: String,
                username: String,
                recipeAndFollowers: String,
                recipeTitle: String,
                categoryName: String,
                foodImageUrl: String,
                commentAndLikes: String,
                isEditorChoice: Bool) {
        self.recipeId = recipeId
        self.userId = userId
        self.usernameImageUrl = usernameImageUrl
        self.username = username
        self.recipeAndFollowers = recipeAndFollowers
        self.recipeTitle = recipeTitle
        self.categoryName = categoryName
        self.foodImageUrl = foodImageUrl
        self.commentAndLikes = commentAndLikes
        self.isEditorChoice = isEditorChoice
    }
}
