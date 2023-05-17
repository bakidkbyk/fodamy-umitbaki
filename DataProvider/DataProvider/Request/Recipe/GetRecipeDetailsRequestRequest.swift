//
//  GetRecipeDetailsRequestRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 13.04.2023.
//

public struct GetRecipeDetailsRequestRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = RecipeDetails
    
    public var path: String = "recipe/{recipeId}"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(recipeId: Int) {
        self.path = "recipe\(recipeId)"
    }
    
}
