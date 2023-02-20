//
//  User.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 24.01.2023.
//

public struct User: Decodable {
    
    public let id: Int
    public let username: String
    public let image: Image
    public let followedCount: Int
    public let followingCount: Int
    public let recipeCount: Int
    public let isFollowing: Bool
    public let favoritesCount: Int
    public let likesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case image
        case followedCount = "followed_count"
        case followingCount = "following_count"
        case recipeCount = "recipe_count"
        case isFollowing = "is_following"
        case favoritesCount = "favorites_count"
        case likesCount = "likes_count"
    }
}
