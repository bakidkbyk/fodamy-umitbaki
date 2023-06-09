//
//  PostRecipeCommentRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 2.06.2023.
//

public struct PostRecipeCommentRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = RecipeComment

    public var path: String = "recipe/{recipeId}/comment"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(recipeId: Int, commentText: String) {
        self.path = "recipe/\(recipeId)/comment"
        self.parameters["text"] = commentText
    }
    
}
