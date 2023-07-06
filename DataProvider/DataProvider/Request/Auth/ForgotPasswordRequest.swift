//
//  ForgotPasswordRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 31.01.2023.
//

public struct ForgotPasswordRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public let path: String = "auth/forgot"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(email: String) {
        parameters["email"] = email
    }
}
