//
//  RegisterRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 24.01.2023.
//

public struct RegisterRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth

    public let path: String = "auth/register"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(username: String, email: String, password: String) {
        parameters["username"] = username
        parameters["email"] = email
        parameters["password"] = password
    }
}
