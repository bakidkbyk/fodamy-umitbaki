//
//  GetRecipesRequestRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 20.02.2023.
//

public struct EditorChoicesRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[Recipe]>
    
    public var path: String = "editor-choices"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(page: Int) {
        self.parameters["page"] = page
 
    }
}
