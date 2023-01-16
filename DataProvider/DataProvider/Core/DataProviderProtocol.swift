//
//  DataProviderProtocol.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 11.01.2023.
//

public typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol DataProviderProtocol {
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
    
}
