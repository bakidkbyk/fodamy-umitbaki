//
//  FavoritesCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.03.2023.
//

public protocol FavoritesCellDataSource {
    
    var recipeImage: Int { get }
    var recipeTitle: String? { get }
    var userImage: String? { get }
    var username: String? { get }
    var categoryImage: String? { get }
    var recipeDescription: String? { get }
    var commentAndLikes: String? { get }
}

public protocol FavoritesCellEventSource { }

public protocol FavoritesCellProtocol: FavoritesCellDataSource, FavoritesCellEventSource { }

public class FavoritesCellModel: FavoritesCellProtocol {
    
    public var recipeImage: Int
    public var recipeTitle: String?
    public var userImage: String?
    public var username: String?
    public var categoryImage: String?
    public var recipeDescription: String?
    public var commentAndLikes: String?
    
    public init(recipeImage: Int,
                recipeTitle: String?,
                username: String?,
                categoryImage: String?,
                recipeDescription: String?,
                commentAndLikes: String?) {
        self.recipeImage = recipeImage
        self.recipeTitle = recipeTitle
        self.username = username
        self.categoryImage = categoryImage
        self.recipeDescription = recipeDescription
        self.commentAndLikes = commentAndLikes
    }
}
