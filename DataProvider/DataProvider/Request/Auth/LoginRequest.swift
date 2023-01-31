//
//  LoginRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 31.01.2023.
//

public struct LoginRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public let path: String = "auth/login"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(username: String, password: String) {
        parameters["username"] = username
        parameters["password"] = password
    }
}
