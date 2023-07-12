//
//  CommentDeleteRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 10.07.2023.
//

public struct CommentDeleteRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "recipe/{recipeId}/comment/{commentId}"
    public var method: RequestMethod = .delete
    
    public init(recipeId: Int, commentId: Int) {
        self.path = "recipe/\(recipeId)/comment/\(commentId)"
    }
}
