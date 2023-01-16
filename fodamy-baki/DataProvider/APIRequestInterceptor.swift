//
//  APIRequestInterceptor.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 16.01.2023.
//

import Alamofire
import KeychainSwift

public class APIRequestInterceptor: RequestInterceptor {
    
    public static let shared = APIRequestInterceptor()
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        let accessToken = KeychainSwift().get(Keychain.token)
        
        if let accessToken = accessToken {
            urlRequest.headers.add(name: "X-Fodamy-Token", value: accessToken)
        }

        completion(.success(urlRequest))
    }
}
