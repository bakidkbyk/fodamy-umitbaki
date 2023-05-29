//
//  GetRecipeDetailsRequestRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 13.04.2023.
//

public struct GetRecipeDetailsRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = RecipeDetails
    
    public var path: String = "recipe/{recipeId}"
    public var method: RequestMethod = .get
    
    public init(recipeId: Int) {
        self.path = "recipe/\(recipeId)"
    }
    
}
