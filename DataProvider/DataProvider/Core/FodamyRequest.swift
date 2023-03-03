//
//  FodamyRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 2.03.2023.
//

public protocol FodamyRequest: DecodableResponseRequest { }

// MARK: - Default Values
public extension FodamyRequest {
    
    var parameters: RequestParameters {
        return [:]
    }
    
    var headers: RequestHeaders {
        return [:]
    }
    
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        case .connect, .delete, .head, .options, .patch, .post, .put, .trace:
            return .json
        }
    }
    
    var url: String {
        return "https://fodamy.mobillium.com/api/" + path
    }
}
