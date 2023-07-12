//
//  CommentEditRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 8.07.2023.
//

public struct CommentEditRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "recipe/{recipeId}/comment/{commentId}"
    public var method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    
    public init(recipeId: Int, commentId: Int, commentText: String) {
        self.path = "recipe/\(recipeId)/comment/\(commentId)"
        self.parameters["text"] = commentText
    }
}
