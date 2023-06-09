//
//  GetRecipeCommentRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 2.06.2023.
//

public struct GetRecipeCommentsRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[RecipeComment]>
    
    public var path: String = "recipe/{recipeId}/comment"
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(recipeId: Int, page: Int? = 1) {
        self.path = "recipe/\(recipeId)/comment"
        self.parameters["page"] = page
    }
    
}
