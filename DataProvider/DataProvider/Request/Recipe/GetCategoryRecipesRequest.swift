//
//  GetCategoryRecipesRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 7.03.2023.
//

public struct GetCategoryRecipesRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[CategoryRecipes]>
    
    public let path: String = "category-recipes"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(page: Int) {
        parameters["page"] = page
    }
    
}
