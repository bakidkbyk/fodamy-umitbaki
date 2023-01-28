//
//  LoginRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 28.01.2023.
//

public struct LoginRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public let path: String = "auth/Login"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(email: String, password: String) {
        parameters["email"] = email
        parameters["password"] = password
    }
}
