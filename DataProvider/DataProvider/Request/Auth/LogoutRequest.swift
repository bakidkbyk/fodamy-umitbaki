//
//  LogoutRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 13.02.2023.
//

public struct LogoutRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public var path: String = "auth/logout"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {}
    
}
