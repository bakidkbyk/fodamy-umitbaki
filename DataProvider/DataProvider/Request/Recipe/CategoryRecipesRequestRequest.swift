//
//  CategoryRecipesRequestRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 26.02.2023.
//

public struct CategoryRecipesRequestRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[Recipe]>
    
    public var path: String = "category/{categoryId}/recipe"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(page: Int, categoryId: Int) {
        self.parameters["page"] = page
        self.path = "category/\(categoryId)/recipe"
    }
    
}
