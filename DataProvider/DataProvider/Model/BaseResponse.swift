//
//  BaseResponse.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 20.02.2023.
//

public struct BaseResponse<T: Decodable>: Decodable {
    
    public let data: T
    public let pagination: Pagination
}
