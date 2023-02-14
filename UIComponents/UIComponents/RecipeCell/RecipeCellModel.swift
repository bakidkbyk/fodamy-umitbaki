//
//  RecipeCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 13.02.2023.
//

public protocol RecipeCellDataSource {
    var usernameImageUrl: String { get }
    var username: String { get }
    var recipeAndFollowers: String { get }
    var recipeTitle: String { get }
    var recipeDesctription: String { get }
    var foodImageUrl: String { get }
    var commentAndLikes: String { get }
}
public protocol RecipeCellEventSource { }

public protocol RecipeCellProtocol : RecipeCellDataSource, RecipeCellEventSource { }

public class RecipeCellModel: RecipeCellProtocol {
    
    public var usernameImageUrl: String
    public var username: String
    public var recipeAndFollowers: String
    public var recipeTitle: String
    public var recipeDesctription: String
    public var foodImageUrl: String
    public var commentAndLikes: String
 
    public init(usernameImageUrl: String, username: String, recipeAndFollowers: String, recipeTitle: String, recipeDescription: String, foodImageUrl: String, commentAndLikes: String) {
        self.usernameImageUrl = usernameImageUrl
        self.username = username
        self.recipeAndFollowers = recipeAndFollowers
        self.recipeTitle = recipeTitle
        self.recipeDesctription = recipeDescription
        self.foodImageUrl = foodImageUrl
        self.commentAndLikes = commentAndLikes
    }
}
