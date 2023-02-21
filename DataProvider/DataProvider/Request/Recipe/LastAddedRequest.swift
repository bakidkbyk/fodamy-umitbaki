//
//  LastAddedRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 21.02.2023.
//

public struct LastAddedRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[Recipe]>
    
    public var path: String = "recipe/"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(page: Int) {
        self.parameters["page"] = page
    }
    
}
