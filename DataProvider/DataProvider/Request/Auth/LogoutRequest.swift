//
//  LogoutRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 13.02.2023.
//

public struct LogoutRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "auth/logout"
    public var method: RequestMethod = .post
    
    public init() {}
}
