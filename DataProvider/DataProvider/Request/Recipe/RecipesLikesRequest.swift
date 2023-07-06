//
//  GetRecipesLikesRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 26.06.2023.
//

public struct RecipesLikesRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "recipe/{recipeId}/like"
    public var method: RequestMethod = .post
    public let likeType: LikeType
    
    public init(recipeId: Int, likeType: LikeType) {
        self.path = "recipe/\(recipeId)/like"
        self.likeType = likeType
        switch likeType {
        case .like:
            method = .post
        case .unlike:
            method = .delete
        }
    }
    
    public enum LikeType {
        case like
        case unlike
    }
}
