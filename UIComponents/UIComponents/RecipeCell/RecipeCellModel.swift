//
//  RecipeCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 13.02.2023.
//

public protocol RecipeCellDataSource {
    var usernameImage: UIImage { get }
    var username: String { get }
    var recipeCount: Int { get }
    var followers: Int { get }
    var recipeTitle: String { get }
    var recipeDesctription: String { get }
    var foodImage: UIImage { get }
    var commentCount: Int { get }
    var likeCount: Int { get }
}
public protocol RecipeCellEventSource { }

public protocol RecipeCellProtocol : RecipeCellDataSource, RecipeCellEventSource { }

public class RecipeCellModel: RecipeCellProtocol {
    
    public var usernameImage: UIImage
    public var username: String
    public var recipeCount: Int
    public var followers: Int
    public var recipeTitle: String
    public var recipeDesctription: String
    public var foodImage: UIImage
    public var commentCount: Int
    public var likeCount: Int
    
    public init(usernameImage: UIImage, username: String, recipeCount: Int, followers: Int, recipeTitle: String, recipeDescription: String, foodImage: UIImage, commentCount: Int, likeCount: Int) {
        self.usernameImage = usernameImage
        self.username = username
        self.recipeCount = recipeCount
        self.followers = followers
        self.recipeTitle = recipeTitle
        self.recipeDesctription = recipeDescription
        self.foodImage = foodImage
        self.commentCount = commentCount
        self.likeCount = likeCount
    }
}
