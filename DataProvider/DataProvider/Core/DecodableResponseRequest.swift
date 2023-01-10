//
//  DecodableResponseRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 10.01.2023.
//

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
