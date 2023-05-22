//
//  FavoritesCollectionCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 12.03.2023.
//

public protocol FavoritesCollectionCellDataSource {
    var recipeId: Int { get }
    var userImage: String? { get }
    var username: String? { get }
    var recipeImage: String? { get }
    var recipeTitle: String? { get }
    var commentAndLikes: String? { get }

}

public protocol FavoritesCollectionCellEventSource { }

public protocol FavoritesCollectionCellProtocol: FavoritesCollectionCellDataSource, FavoritesCollectionCellEventSource { }

public class FavoritesCollectionCellModel: FavoritesCollectionCellProtocol {
    
    public var recipeId: Int
    public var userImage: String?
    public var username: String?
    public var recipeImage: String?
    public var recipeTitle: String?
    public var commentAndLikes: String?
    
    public init(recipeId: Int, userImage: String?, username: String?, recipeImage: String?, recipeTitle: String?, commentAndLikes: String?) {
        self.recipeId = recipeId
        self.userImage = userImage
        self.username = username
        self.recipeImage = recipeImage
        self.recipeTitle = recipeTitle
        self.commentAndLikes = commentAndLikes
    }
}
